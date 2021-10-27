import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/transaction_widget.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
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
        Semantics(
          child: Text(
            S.of(context).homeScreen_recentTransactions_pageSubtitle,
            style: AppTextStyles.kMenuTitle(context),
          ),
          header: true,
        ),
        const SizedBox(height: kHalfPadding),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          // separatorBuilder: (context, index) {
          //   return const SizedBox(height: kHalfPadding);
          // },
          shrinkWrap: true,
          itemCount: myTransactions.length <= ksMaxRecentTransactionsCount
              ? myTransactions.length
              : ksMaxRecentTransactionsCount,
          itemBuilder: (_, index) {
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
