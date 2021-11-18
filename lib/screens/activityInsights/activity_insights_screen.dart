import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/components/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/transaction_widget.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/main.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

PageStorageBucket bucketStorageForActivityScreen = PageStorageBucket();

class ActivityInsightsScreen extends StatefulWidget {
  ActivityInsightsScreen({Key? key}) : super(key: key);

  final keyScreen = GlobalKey<_ActivityInsightsScreenState>();
  late ValueKey<_ActivityInsightsScreenState> keyValueScreen;

  @override
  State<ActivityInsightsScreen> createState() => _ActivityInsightsScreenState();
}

class _ActivityInsightsScreenState extends State<ActivityInsightsScreen>
// implements AutomaticKeepAliveClientMixin<ActivityInsightsScreen> //
{
  final itemController = ItemScrollController();
  final itemsListener = ItemPositionsListener.create();
  bool _isFloatingButtonVisible = true;
  final double _listScrollBottomSpacer = 360.0;

  final transactionList = <TransactionCard>[];
  late List<int> indicesVisible = <int>[];

  // @override
  // void updateKeepAlive() {
  //   super.updateKeepAlive();
  // }
  // @override
  // bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    final providerDB = Provider.of<DBSyncProvider>(context, listen: false);

    itemsListener.itemPositions.addListener(() {
      indicesVisible = itemsListener.itemPositions.value
          .where((item) {
            // if (item.index == 10) print(item.itemLeadingEdge);
            // if (item.index == 10) print(item.itemTrailingEdge);
            final _isTopVisible = item.itemLeadingEdge >= -0.045;
            final _isBottomVisible = item.itemTrailingEdge <= 1.40 /*1.0*/ &&
                item.itemTrailingEdge > 0.055;

            return _isTopVisible && _isBottomVisible;
          })
          .map((item) => item.index)
          .toList();

      // print(indicesVisible);
    });

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      // WidgetsBinding.instance?.addPostFrameCallback
      providerDB.markNotificationsAsRead();

      // scrollToItem(transactionList.length - 1);
      // transactionList[transactionList.length - 1].onPress.call();
    });
  }

  Future scrollToItem(int index) async {
    itemController.scrollTo(
        index: index, alignment: 0.33, duration: kShorterDuration);
  }

  Future scrollToFirst() async {
    itemController.scrollTo(
        index: 0, alignment: 0.33, duration: kShorterDuration);
  }

  Future scrollToLast() async {
    itemController.scrollTo(
        index: transactionList.length - 1,
        alignment: 0.33,
        duration: kShorterDuration);
  }

  @override
  Widget build(BuildContext context) {
    MyApp.changeWebAppTabName(
        label: S.of(context).homeScreen_third_tabBarTitle);

    return WillPopScope(
      onWillPop: () {
        // TODO: this is not being called - maybe SetupScreen routes decision?
        Provider.of<DBSyncProvider>(context, listen: false)
            .clearClickedTransactionIndex();
        return Future.value(true);
      },
      child: Scaffold(
        key: widget.keyScreen,
        appBar: AppBarComplete(
          title: S.of(context).homeScreen_third_tabBarTitle,
          hasNotificationsButton: false,
        ),
        floatingActionButton: _isFloatingButtonVisible
            ? AppFloatingButtonIconAndText(
                icon: Icons.arrow_downward_rounded,
                label: null,
                tooltip: S
                    .of(context)
                    .activityScreen_TOOLTIP_fabDownward_description,
                // TODO
                onPressed: () =>
                    scrollToItem((indicesVisible.last * 1.5).abs().round()),
              )
            : AppFloatingButtonIconAndText(
                icon: Icons.arrow_upward_rounded,
                label: null,
                tooltip:
                    S.of(context).activityScreen_TOOLTIP_fabUpward_description,
                // TODO
                onPressed: () =>
                    scrollToItem((indicesVisible.first / 2.5).abs().ceil()),
              ),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            // opposite
            if (notification.direction == ScrollDirection.reverse) {
              if (!_isFloatingButtonVisible)
                setState(() => _isFloatingButtonVisible = true);
            } else if (notification.direction == ScrollDirection.forward) {
              if (_isFloatingButtonVisible)
                setState(() => _isFloatingButtonVisible = false);
            }
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kHalfPadding), // only
            child: PageStorage(
              bucket: bucketStorageForActivityScreen,
              child: Scrollbar(
                isAlwaysShown: WebProvider.isWebPlatform,
                child: Column(
                  children: [
                    Expanded(
                      child: ScrollablePositionedList.separated(
                        itemScrollController: itemController,
                        itemPositionsListener: itemsListener,
                        key: const PageStorageKey<String>('activityScreenKey'),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: kHalfPadding);
                        },
                        itemCount: myTransactions.length,
                        itemBuilder: (_, int index) {
                          var newItem = TransactionCard(
                            transaction: myTransactions[index],
                            transactionIndex: index,
                            withAvatarImage: false,
                            // TODO
                            onPress: () =>
                                AppSlidingBottomSheet.demoSheet(context),
                          );
                          transactionList.add(newItem);

                          return ResponsiveWidthConstrained(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: kDefaultPadding,
                                  right: kDefaultPadding,
                                  bottom: index == myTransactions.length - 1
                                      ? _listScrollBottomSpacer
                                      : 0),
                              child: newItem,
                            ),
                          );
                        },
                        padding: const EdgeInsets.only(bottom: kHalfPadding),
                      ),
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
