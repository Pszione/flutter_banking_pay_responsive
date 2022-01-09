import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../layers/layers.dart';
import '../../ui.dart';

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
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return const SizedBox(height: kHalfPadding);
          },
          // TODO: implement controller
          itemCount: myTransactions.length <= ksMaxRecentTransactionsCount
              ? myTransactions.length
              : ksMaxRecentTransactionsCount,
          itemBuilder: (_, index) {
            return TransactionCard(
              transaction: myTransactions[index],
              onPress: () {
                Provider.of<SetupScreen>(context, listen: false)
                    .keyValueScreen
                    .value
                    .changeSelectedMenuByState(MenuState.insights);
                // ActivityInsights is listening to it
                Provider.of<DBSyncProvider>(context, listen: false)
                    .setClickedTransactionIndex(index);
              },
            );
          },
          padding: const EdgeInsets.only(bottom: kHalfPadding),
        ),
      ],
    );
  }
}
