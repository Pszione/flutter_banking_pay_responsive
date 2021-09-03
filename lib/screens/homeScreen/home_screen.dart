import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/recent_transactions_section.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/user_cards_section.dart';

import '../../constant_text_styles.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComplete(
        title: 'My Bank',
        hasSearchField: true,
      ),
      // Cards
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const UserCardsSection(),
              const SizedBox(height: kDefaultPadding),
              const RecentTransactionsSection(),
              const SizedBox(height: kDefaultPadding),
              const TransferMoneySection(),
            ],
          ),
        ),
      ),
    );
  }
}

class TransferMoneySection extends StatelessWidget {
  const TransferMoneySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: kMediumIconSize,
            child: Icon(
              Icons.add,
              size: 50,
            ),
          ),
          const SizedBox(height: kHalfPadding),
          Text(
            'Transfer Money',
            style: AppTextStyle.kListTileTitle,
          ),
        ],
      ),
    );
  }
}
