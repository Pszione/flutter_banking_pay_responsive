import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/recent_transactions_section.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/user_cards_section.dart';

import '../../constant_text_styles.dart';
import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get userCards => null;

  //late SizeConfig _sizes;

  @override
  Widget build(BuildContext context) {
    //final SizeConfig _sizes = SizeConfig().init(context);

    return Scaffold(
      appBar: AppBarComplete(
        title: 'My Bank',
        hasSearchField: true,
      ),
      // Cards
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const UserCardsSection(),
              const SizedBox(height: kDefaultPadding),
              const RecentTransactionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
