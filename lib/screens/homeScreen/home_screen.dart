import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_speed_dial.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/recent_transactions_section.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/user_cards_section.dart';

import '../../constants.dart';
import 'categories_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static EdgeInsets desiredPadding = const EdgeInsets.only(
      left: kDefaultPadding, right: kDefaultPadding, top: kHalfPadding);

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
                tooltip: S.of(context).homeScreen_TOOLTIP_fab_options,
                openCloseState: openCloseState,
              )
            : AppFloatingButtonSpeedDial(
                label: null,
                icon: Icons.read_more_rounded,
                tooltip: S.of(context).homeScreen_TOOLTIP_fab_options,
                openCloseState: openCloseState,
              ),
        floatingActionButtonLocation: kFloatingButtonLocationFixed(context),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            // Get screen page scroll and block children widget listviews scroll notifications
            if (notification.metrics.axis != Axis.vertical) {
              return true;
            }
            if (notification.direction == ScrollDirection.forward) {
              if (!_isFloatingButtonVisible)
                setState(() => _isFloatingButtonVisible = true);
            } else if (notification.direction == ScrollDirection.reverse) {
              if (_isFloatingButtonVisible)
                setState(() => _isFloatingButtonVisible = false);
            }
            return true;
          },
          // Un focus keyboard/textfield
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.translucent,
            excludeFromSemantics: true,
            child: ListView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              // padding: const EdgeInsets.symmetric
              children: [
                Semantics(
                  child: UserCardsSection(
                      desiredPadding: HomeScreen.desiredPadding),
                  label: S.of(context).homeScreen_userCardSection_pageSubtitle,
                  slider: true,
                ),
                const SizedBox(height: kDefaultPadding),
                Padding(
                    padding: HomeScreen.desiredPadding,
                    child: Semantics(child: const CategoriesSection())),
                const SizedBox(height: kDefaultPadding),
                Padding(
                    padding: HomeScreen.desiredPadding,
                    child: Semantics(child: const RecentTransactionsSection())),
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
