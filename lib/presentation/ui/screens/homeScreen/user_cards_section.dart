import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/presentation/controllers/card_screen_controller.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_add_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_overview_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/designSystem/constants.dart';
import 'package:flutter_banking_pay_responsive/presentation/controllers/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_widget.dart';
import 'package:get_it/get_it.dart';

class UserCardsSection extends StatelessWidget {
  UserCardsSection({
    Key? key,
    required this.desiredPadding,
  }) : super(key: key);

  // TODO: should only depend on a repository
  final CardScreenController controller = GetIt.I<CardScreenController>();
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
        itemCount: controller.cards.length + 1,
        itemBuilder: (_, index) {
          // checking if the index item is the last item of the list or not
          if (index == controller.cards.length) {
            return CardOutlineWidget(
                width: 320,
                label: S.of(context).cardWidgetOutlined_addPaymentMethod_title,
                onPress: () => handleOnPressCard(context));
          }
          return CardWidget(
            card: controller.cards[index],
            index: index,
            width: 320,
            onPress: () => AppSlidingBottomSheet(
              context: context,
              headerColor: controller.getCardColorNullSafety(
                  controller.cards[index],
                  opacity: 0.85),
              bodyWidget:
                  CardOverviewSlidingSheet(card: controller.cards[index]),
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

  Future<void> handleOnPressCard(BuildContext context) =>
      CardAddSlidingSheet().showOptionsSlidingSheet(context);
}
