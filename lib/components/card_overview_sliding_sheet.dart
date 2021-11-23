import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/categories_cards.dart';
import 'package:flutter_banking_pay_responsive/snackbar_errors.dart';

class CardOverviewSlidingSheet extends StatelessWidget {
  const CardOverviewSlidingSheet({Key? key, required this.card})
      : super(key: key);

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        // fit: StackFit.loose,
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.97, // 780,
            color: CardModel.getCardColorNullSafety(card: card, opacity: 0.85),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.77,
            margin: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kHalfPadding),
            padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: kDefaultBorderRadius,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kHugePadding),
                    child: Text(
                      S.of(context).other_TOOLTIP_closeButton,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
              // Builder(
              //     // sheetController needs a builder around it to get the right context
              //     child: const Text('Show more'),
              //     onPressed: () =>
              //         SheetController.of(context)!.expand(),
              // ),

              const SizedBox(height: kDefaultPadding),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: double.infinity,
                  // height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: kHalfPadding),
                        child: CategoryCard(
                          label: 'Open Bank',
                          icon: Icons.account_balance_rounded,
                          onPress: () =>
                              AppSnackBarErrors.showSnackBarFeatureUnavailable(
                                  context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHalfPadding),
                        child: CategoryCard(
                          label: 'Block Card',
                          icon: Icons.add_alert_sharp,
                          onPress: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHalfPadding),
                        child: CategoryCard(
                          label: S
                              .of(context)
                              .homeScreen_supportChat_categoryTitle,
                          icon: Icons.chat_outlined,
                          onPress: () =>
                              AppSnackBarErrors.showSnackBarFeatureUnavailable(
                                  context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                '${card.cardHolderName}',
                style: AppTextStyles.getBodyText(context)
                    .copyWith(fontSize: 21, overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: CardWidget.buildCardLogo(card),
              ),
              Text(
                CardModel.getCardNickname(card)!,
                style: AppTextStyles.getBodyText(context)
                    .copyWith(fontSize: 22, overflow: TextOverflow.ellipsis),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kHugePadding),
                  child: Text(
                    'Edit card info',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 2),
            ],
          ),
        ],
      ),
    );
  }
}
