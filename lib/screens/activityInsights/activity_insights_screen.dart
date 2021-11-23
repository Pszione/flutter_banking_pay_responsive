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
import 'package:share_plus/share_plus.dart';

PageStorageBucket bucketStorageForActivityScreen = PageStorageBucket();

class ActivityInsightsScreen extends StatefulWidget with ChangeNotifier {
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

  @override
  void initState() {
    super.initState();

    widget.keyValueScreen = ValueKey(this);

    itemsListener.itemPositions.addListener(trackOnScreenIndices);

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      // WidgetsBinding.instance?.addPostFrameCallback
      Provider.of<DBSyncProvider>(context, listen: false)
          .markNotificationsAsRead();
    });
  }

  @override
  void dispose() {
    itemsListener.itemPositions.removeListener(trackOnScreenIndices);
    //
    super.dispose();
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

  void openSelectedTransaction(int index) {
    if (transactionList.isEmpty || index >= transactionList.length) {
      print('Error: ${openSelectedTransaction.toString()}');
      return;
    }
    scrollToItem(index);
    // transactionList[index].onPress.call(); // TODO
  }

  void trackOnScreenIndices() {
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
  }

  void handleObservableTransactionOpening() async {
    await Future.delayed(const Duration(milliseconds: 500));
    var provider = Provider.of<DBSyncProvider>(context, listen: false);

    if (provider.clickedTransactionIndex != null) {
      print('Transactions index is: ${provider.clickedTransactionIndex}');
      openSelectedTransaction(provider.clickedTransactionIndex!);

      await Future.delayed(const Duration(seconds: 3));
      provider.clearClickedTransactionIndex(); // important
    }
  }

  @override
  Widget build(BuildContext context) {
    MyApp.changeWebAppTabName(
        label: S.of(context).homeScreen_third_tabBarTitle);

    handleObservableTransactionOpening();

    return Scaffold(
      key: widget.keyScreen,
      appBar: AppBarComplete(
        title: S.of(context).homeScreen_third_tabBarTitle,
        hasNotificationsButton: false,
        hasDarkThemeToggle: true,
      ),
      floatingActionButton: _isFloatingButtonVisible
          ? AppFloatingButtonIconAndText(
              icon: Icons.arrow_downward_rounded,
              label: null,
              tooltip:
                  S.of(context).activityScreen_TOOLTIP_fabDownward_description,
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
                        withClickableIndicator: true,
                        // TODO
                        onPress: () => Share.share(
                            '${S.of(context).share_message_checkOutMyNewProject} $K_WEBSITE_PEDRO_SANTOS',
                            subject: S.of(context).share_message_iveDoneIt),
                        // onPress: () => AppSlidingBottomSheet.demoSheet(context),
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
                if (MediaQuery.of(context).orientation == Orientation.portrait)
                  const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
