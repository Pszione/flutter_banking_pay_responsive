import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_add_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_overview_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/layers/domain/card.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/designSystem/constants.dart';
import 'package:flutter_banking_pay_responsive/presentation/controllers/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_widget.dart';

class UserCardsSection extends StatelessWidget {
  const UserCardsSection({
    Key? key,
    required this.desiredPadding,
  }) : super(key: key);

  final EdgeInsets desiredPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        key: const PageStorageKey<String>('homeScreenUserCardsKey'),
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: kHalfPadding);
        },
        shrinkWrap: true,
        // TODO: implement controller
        itemCount: myCards.length + 1,
        itemBuilder: (_, index) {
          // checking if the index item is the last item of the list or not
          if (index == myCards.length) {
            return CardOutlineWidget(
                width: 320,
                label: S.of(context).cardWidgetOutlined_addPaymentMethod_title,
                onPress: () =>
                    CardAddSlidingSheet().showOptionsSlidingSheet(context));
          }
          return CardWidget(
            card: myCards[index],
            index: index,
            width: 320,
            onPress: () => AppSlidingBottomSheet(
              context: context,
              headerColor: CardModel.getCardColorNullSafety(
                  card: myCards[index], opacity: 0.85),
              bodyWidget: CardOverviewSlidingSheet(card: myCards[index]),
            ).showStyledSheet(),
          );
        },
        padding: EdgeInsets.only(
          left: !WebProvider.isWebPlatform ? desiredPadding.left : 0,
          right: !WebProvider.isWebPlatform ? desiredPadding.right : 0,
          top: desiredPadding.top,
          bottom: desiredPadding.top,
        ),
      ),
    );
  }
}
