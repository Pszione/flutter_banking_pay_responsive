import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/layers/domain/transaction.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/transaction_widget.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/designSystem/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/designSystem/constants.dart';
import 'package:flutter_banking_pay_responsive/presentation/controllers/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/layers/data/enums.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/setupScreen/setup_screen.dart';
import 'package:provider/provider.dart';

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
