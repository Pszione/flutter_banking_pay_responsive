import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/transaction_widget.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constants.dart';

class ActivityInsightsScreen extends StatelessWidget {
  const ActivityInsightsScreen({Key? key}) : super(key: key);

  // final itemController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComplete(
        title: 'Activity Insights',
        hasNotifications: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: SizedBox(
            height: 900,
            child: ScrollablePositionedList.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              // separatorBuilder: (context, index) {
              //   return const SizedBox(width: kHalfPadding);
              // },
              //shrinkWrap: true,
              itemCount: myTransactions.length,
              itemBuilder: (BuildContext context, int index) {
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
    );
  }
}
