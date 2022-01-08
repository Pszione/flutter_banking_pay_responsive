import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../core/core.dart';
import '../../../../layers/layers.dart';
import '../../../../main.dart';
import '../../ui.dart';

// ignore_for_file: curly_braces_in_flow_control_structures
class ActivityInsightsScreen extends StatefulWidget with ChangeNotifier {
  ActivityInsightsScreen({Key? key}) : super(key: key);

  final GlobalKey<ActivityInsightsScreenState> keyScreen =
      GlobalKey<ActivityInsightsScreenState>();
  late ValueKey<ActivityInsightsScreenState> keyValueScreen;

  @override
  State<ActivityInsightsScreen> createState() => ActivityInsightsScreenState();
}

class ActivityInsightsScreenState extends State<ActivityInsightsScreen>
// implements AutomaticKeepAliveClientMixin<ActivityInsightsScreen> //
{
  var controller = G<ActivityInsightsScreenController>();

  final List<TransactionCard> _transactionCards = <TransactionCard>[];
  final itemController = ItemScrollController();
  final itemsListener = ItemPositionsListener.create();
  bool _isFloatingButtonVisible = true;

  @override
  void initState() {
    super.initState();

    widget.keyValueScreen = ValueKey(this);

    itemsListener.itemPositions.addListener(trackOnScreenIndices);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      MyApp.changeWebAppTabName(
          label: S.of(context).homeScreen_third_tabBarTitle);
    });
    SchedulerBinding.instance?.addPostFrameCallback((_) {
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

  void trackOnScreenIndices() {
    controller.indicesVisible = itemsListener.itemPositions.value
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

  void openSelectedTransaction(int index) {
    if (_transactionCards.isEmpty || index >= _transactionCards.length) {
      print('Error: ${openSelectedTransaction.toString()}');
      return;
    }
    scrollToItem(index);
    // transactionList[index].onPress.call(); // TODO
  }

  Future<void> scrollToItem(int index) async {
    itemController.scrollTo(
        index: index, alignment: 0.33, duration: kShorterDuration);
  }

  Future<void> scrollToFirst() async {
    itemController.scrollTo(
        index: 0, alignment: 0.33, duration: kShorterDuration);
  }

  Future<void> scrollToLast() async {
    itemController.scrollTo(
        index: _transactionCards.length - 1,
        alignment: 0.33,
        duration: kShorterDuration);
  }

  @override
  Widget build(BuildContext context) {
    controller.handleObservableTransactionOpening(
      context,
      openSelectedTransaction,
    );

    return WillPopScope(
      onWillPop: () {
        Provider.of<DBSyncProvider>(context, listen: false)
            .clearClickedTransactionIndex();
        return Future.value(true);
      },
      child: Scaffold(
        key: widget.keyScreen,
        appBar: AppBarComplete(
          title: S.of(context).homeScreen_third_tabBarTitle,
          hasNotificationsButton: false,
          hasDarkThemeToggle: true,
          googleAvatarThumbnail:
              Provider.of<DBSyncProvider>(context, listen: false)
                  .user
                  .avatarThumbnail,
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
                    scrollToItem(controller.calculateScrollDownIndices()),
              )
            : AppFloatingButtonIconAndText(
                icon: Icons.arrow_upward_rounded,
                label: null,
                tooltip:
                    S.of(context).activityScreen_TOOLTIP_fabUpward_description,
                // TODO
                onPressed: () =>
                    scrollToItem(controller.calculateScrollUpIndices()),
              ),
        bottomNavigationBar:
            Provider.of<NavigationBarShared>(context, listen: false)
                .getNavigationBar,
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
                      itemCount: controller.transactions.length,
                      itemBuilder: (_, int index) {
                        var newItem = TransactionCard(
                          transaction: controller.transactions[index],
                          transactionIndex: index,
                          withAvatarImage: false,
                          withClickableIndicator: true,
                          onPress: () => controller.showShareOptions(context),
                        );
                        _transactionCards.add(newItem);

                        return ResponsiveWidthConstrained(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: kDefaultPadding,
                                right: kDefaultPadding,
                                bottom:
                                    index == controller.transactions.length - 1
                                        ? controller.listScrollBottomSpacer
                                        : 0),
                            child: newItem,
                          ),
                        );
                      },
                      padding: const EdgeInsets.only(bottom: kHalfPadding),
                    ),
                  ),
                  if (MediaQuery.of(context).orientation ==
                      Orientation.portrait)
                    const SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
