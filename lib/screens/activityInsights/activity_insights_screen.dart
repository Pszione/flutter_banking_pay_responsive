import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/components/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/transaction_widget.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';

import '../../constants.dart';

class ActivityInsightsScreen extends StatelessWidget {
  const ActivityInsightsScreen({Key? key}) : super(key: key);

  // void scrollToIndex(int index) {
  //   itemController.jumpTo(index: index);
  //   //itemController.scrollTo(index: index, duration: kDefaultDuration);
  // }
  //
  // void scrollToNext() {
  //   setState(() {
  //     currentIndex++;
  //     if (currentIndex >= myTransactions.length) currentIndex = 0;
  //   });
  //   print(currentIndex);
  //   scrollToIndex(currentIndex);
  // }

  @override
  Widget build(BuildContext context) {
    print(myTransactions.length);
    return Scaffold(
      appBar: const AppBarComplete(
        title: 'Activity Insights',
        hasNotifications: false,
      ),
      floatingActionButton: AppFloatingButtonIconAndText(
        icon: Icons.arrow_downward_rounded,
        label: null,
        tooltip: 'Jump, Jump',
        // TODO
        onPressed: () {},
      ),
      body: SingleChildScrollView(
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
    );
  }
}
