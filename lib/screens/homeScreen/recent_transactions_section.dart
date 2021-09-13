import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/example_card_with_buttons.dart';
import 'package:flutter_banking_pay_responsive/components/transaction_widget.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';

import '../../constant_text_styles.dart';
import '../../constants.dart';

class RecentTransactionsSection extends StatelessWidget {
  const RecentTransactionsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Transactions',
          style: AppTextStyles.kMenuTitle(context),
        ),
        const SizedBox(height: kHalfPadding),
        ListView.builder(
          //physics: const NeverScrollableScrollPhysics(),
          // separatorBuilder: (context, index) {
          //   return const SizedBox(height: kHalfPadding);
          // },
          itemCount: myTransactions.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return TransactionCard(
              transaction: myTransactions[index],
              onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const ActivityInsightsScreen(),
                  )),
            );
          },
        ),
        // Example
        // const ExampleCardWithButtons(),
      ],
    );
  }
}
