import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/components/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/transaction_widget.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data_providers.dart';

class ActivityInsightsScreen extends StatefulWidget {
  const ActivityInsightsScreen({Key? key}) : super(key: key);

  @override
  State<ActivityInsightsScreen> createState() => _ActivityInsightsScreenState();
}

class _ActivityInsightsScreenState extends State<ActivityInsightsScreen>
// implements AutomaticKeepAliveClientMixin<ActivityInsightsScreen> //
{
  // @override
  // void updateKeepAlive() {
  //   super.updateKeepAlive();
  // }
  //
  // @override
  // bool get wantKeepAlive => true;

  bool _isFloatingButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DBSyncProvider>(context);
    // TODO: wait for user interaction with the notifications
    dbProvider.markNotificationsAsRead();

    return Scaffold(
      appBar: const AppBarComplete(
        title: 'Activity Insights',
        hasNotificationsButton: false,
      ),
      floatingActionButton: _isFloatingButtonVisible
          ? AppFloatingButtonIconAndText(
              icon: Icons.arrow_downward_rounded,
              label: null,
              tooltip: 'Jump, Jump',
              // TODO
              onPressed: () {},
            )
          : AppFloatingButtonIconAndText(
              icon: Icons.arrow_upward_rounded,
              label: null,
              tooltip: 'Up, up',
              // TODO
              onPressed: () {},
            ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            if (!_isFloatingButtonVisible)
              setState(() => _isFloatingButtonVisible = true);
          } else if (notification.direction == ScrollDirection.reverse) {
            if (_isFloatingButtonVisible)
              setState(() => _isFloatingButtonVisible = false);
          }
          return true;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: SizedBox(
              width: double.infinity,
              height: 1200,
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: kHalfPadding);
                },
                //shrinkWrap: true,
                itemCount: myTransactions.length,
                itemBuilder: (_, int index) {
                  return TransactionCard(
                    transaction: myTransactions[index],
                    onPress: () => AppSlidingBottomSheet.demoSheet(context),
                  );
                },
                padding: const EdgeInsets.only(bottom: kHalfPadding),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
