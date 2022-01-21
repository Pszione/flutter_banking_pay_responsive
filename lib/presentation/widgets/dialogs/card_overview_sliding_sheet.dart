import 'package:flutter/material.dart';

import '../../../layers/layers.dart';
import '../../ui/ui.dart';

class CardOverviewSlidingSheet extends StatelessWidget {
  const CardOverviewSlidingSheet({Key? key, required this.card})
      : super(key: key);

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.97, // 780,
            color: CardModel.getCardColorNullSafety(
              card: card,
              opacity: 0.85,
            ),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.77,
            margin: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: kHalfPadding,
            ),
            padding: const EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              top: kDefaultPadding,
            ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: kHugePadding,
                    ),
                    child: Text(
                      S.of(context).other_TOOLTIP_closeButton,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
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
                          label: S
                              .of(context)
                              .cardOverviewBottomSheet_openBank_categoryTitle,
                          icon: Icons.account_balance_rounded,
                          onPress: () =>
                              AppSnackBarErrors.showSnackBarFeatureUnavailable(
                                  context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: kHalfPadding),
                        child: CategoryCard(
                          label: S
                              .of(context)
                              .cardOverviewBottomSheet_blockCard_categoryTitle,
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
                style: AppTextStyles.getBodyText(context).copyWith(
                  fontSize: 21,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: CardWidget.buildCardLogo(card),
              ),
              if (card.nickname != null)
                Text(
                  card.nickname!,
                  style: AppTextStyles.getBodyText(context).copyWith(
                    fontSize: 22,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (card.cardNumber != null)
                Text(
                  card.cardNumber!,
                  style: AppTextStyles.getBodyText(context).copyWith(
                    fontSize: 22,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kHugePadding,
                  ),
                  child: Text(
                    S
                        .of(context)
                        .cardOverviewBottomSheet_editCardInfo_button_title,
                    style: const TextStyle(fontSize: 17),
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
