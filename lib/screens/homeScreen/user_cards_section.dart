import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/card_add_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/card_overview_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';

import '../../constants.dart';

class UserCardsSection extends StatelessWidget {
  const UserCardsSection({
    Key? key,
    required this.desiredPadding,
  }) : super(key: key);

  final EdgeInsets desiredPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        key: const PageStorageKey<String>('homeScreenUserCardsKey'),
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: kHalfPadding);
        },
        shrinkWrap: true,
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
