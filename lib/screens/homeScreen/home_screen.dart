import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/recent_transactions_section.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/user_cards_section.dart';

import '../../constants.dart';
import '../../snackbar_errors.dart';
import 'categories_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComplete(
        title: 'My Bank',
        hasSearchField: true,
        hasDarkThemeToggle: true,
      ),
      // Cards
      floatingActionButton: AppFloatingButtonIconAndText(
        label: null,
        tooltip: 'Options',
        icon: Icons.read_more_rounded,
        onPressed: () =>
            AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
      ),
      floatingActionButtonLocation: kFloatingButtonLocationFixed(context),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          // Un focus keyboard/textfield
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.translucent,
            excludeFromSemantics: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Semantics(
                  child: const UserCardsSection(),
                ),
                const SizedBox(height: kDefaultPadding),
                Semantics(child: const CategoriesSection()),
                const SizedBox(height: kDefaultPadding),
                Semantics(child: const RecentTransactionsSection()),
                const SizedBox(height: kDefaultPadding),
                const SizedBox(height: 160),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
