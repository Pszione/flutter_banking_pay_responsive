import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_speed_dial.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/recent_transactions_section.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/user_cards_section.dart';

import '../../constants.dart';
import 'categories_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFloatingButtonVisible = true;
  ValueNotifier<bool> openCloseState = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (openCloseState.value) {
          /// close speed dial FAB
          openCloseState.value = false;
          // TODO: this is not working
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBarComplete(
          title: S.of(context).homeScreen_first_tabBarTitle,
          hasSearchField: true,
          hasDarkThemeToggle: true,
        ),
        // Cards
        floatingActionButton: _isFloatingButtonVisible
            ? AppFloatingButtonSpeedDial(
                label: S.of(context).homeScreen_fab_title,
                icon: Icons.read_more_rounded,
                tooltip: 'Transaction Options',
                openCloseState: openCloseState,
              )
            : AppFloatingButtonSpeedDial(
                label: null,
                icon: Icons.read_more_rounded,
                tooltip: 'Transaction Options',
                openCloseState: openCloseState,
              ),
        // floatingActionButton: _isFloatingButtonVisible
        //     ? AppFloatingButtonIconAndText(
        //         label: 'Transactions',
        //         tooltip: 'Transaction Options',
        //         icon: Icons.read_more_rounded,
        //         onPressed: () =>
        //             AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        //       )
        //     : AppFloatingButtonIconAndText(
        //         label: null,
        //         tooltip: 'Transaction Options',
        //         icon: Icons.read_more_rounded,
        //         onPressed: () =>
        //             AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        //       ),
        floatingActionButtonLocation: kFloatingButtonLocationFixed(context),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              if (!_isFloatingButtonVisible)
                setState(() => _isFloatingButtonVisible = true);
            } else if (notification.direction == ScrollDirection.reverse) {
              if (_isFloatingButtonVisible)
                setState(() => _isFloatingButtonVisible = false);
            }
            return true;
          },
          child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
