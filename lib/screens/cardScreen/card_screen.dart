import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/components/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/card_add_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/card_overview_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';

import '../../constants.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComplete(
        title: S.of(context).homeScreen_second_tabBarTitle,
        hasNotificationsButton: true,
        hasDarkThemeToggle: true,
      ),
      floatingActionButton: AppFloatingButtonIconAndText(
        label: S.of(context).cardScreen_fab_title,
        tooltip: S.of(context).cardScreen_TOOLTIP_fab_options,
        icon: Icons.add,
        onPressed: () => CardAddSlidingSheet().showOptionsSlidingSheet(context),
        // onPressed: () => const AppAlertDialog(
        //   title: 'Add Card',
        //   contentText: null,
        // ).showAlertDialogDismissible(context),
        // AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
      ),
      floatingActionButtonLocation: kFloatingButtonLocationAdaptive(context),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Responsive.isMobileLarge(context) ? 522 : 200 * 1.07,
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Responsive.isMobileLarge(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                        width: kHalfPadding, height: kDefaultPadding);
                  },
                  shrinkWrap: true,
                  itemCount: myCards.length,
                  itemBuilder: (_, index) {
                    return CardWidget(
                      card: myCards[index],
                      onPress: () => AppSlidingBottomSheet(
                        context: context,
                        headerColor: CardModel.getCardColorNullSafety(
                            card: myCards[index], opacity: 0.85),
                        bodyWidget:
                            CardOverviewSlidingSheet(card: myCards[index]),
                      ).showStyledSheet(),
                    );
                  },
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                ),
              ),
              // Legacy
              // buildAddCardButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
