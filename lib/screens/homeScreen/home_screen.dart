import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/recent_transactions_section.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/user_cards_section.dart';

import '../../constant_text_styles.dart';
import '../../constants.dart';
import '../../snackbar_errors.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const UserCardsSection(),
                const SizedBox(height: kDefaultPadding),
                const RecentTransactionsSection(),
                const SizedBox(height: kDefaultPadding),
                //const TransferMoneySection(),
                const SizedBox(height: 160),
              ],
            ),
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
      child: IconButton(
        iconSize: 160,
        splashRadius: kInkWellMediumRadius,
        onPressed: () =>
            AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        icon: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: kMediumIconSize,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Icons.ios_share,
                size: kHugeIconSize,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            const SizedBox(height: kHalfPadding),
            Text(
              'Transfer Money',
              style: AppTextStyles.kListTileTitle,
            ),
          ],
        ),
      ),
    );
  }
}
