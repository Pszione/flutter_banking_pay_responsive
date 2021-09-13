import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'dart:core';

import 'package:flutter_banking_pay_responsive/models/card_brand.dart';
import 'package:flutter_banking_pay_responsive/models/i_card_implementation.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_sliding_bottom_sheet.dart';
import 'card_overview_sliding_sheet.dart';

class CardWidget extends StatelessWidget implements ICardImplementation {
  CardWidget(
      {Key? key,
      required this.card,
      this.width = 350,
      this.height = 200,
      this.isClickable = true,
      required this.onPress})
      : super(key: key);

  @override
  late CardModel card;
  @override
  late double width, height;
  @override
  late bool isClickable;
  @override
  GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: CardModel.getCardColorNullSafety(card: card, opacity: 0.85),
            borderRadius: kHugeBorderRadius,
            boxShadow: [kBoxDownShadowSubtle],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD NAME",
                        style: AppTextStyles.kCardTitle,
                      ),
                      Text(
                        '${card.cardHolderName}',
                        style: AppTextStyles.kCardSubtitle,
                      ),
                    ],
                  ),
                  Text(
                    '${card.cardNumber}',
                    style: AppTextStyles.kCardSubtitle,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EXP DATE",
                            style: AppTextStyles.kCardTitle,
                          ),
                          Text(
                            '${card.expDate}',
                            style: !CardModel.hasCardExpired(card.expDate)
                                ? AppTextStyles.kCardSubtitle
                                : AppTextStyles.kCardSubtitle
                                    .copyWith(color: kTextRedColor),
                          ),
                        ],
                      ),
                      const SizedBox(width: kDefaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CVV NUMBER",
                            style: AppTextStyles.kCardTitle,
                          ),
                          Text(
                            '${card.cvv}',
                            style: AppTextStyles.kCardSubtitle,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: buildCardLogo(card),
                  ),
                  if (CardModel.hasCardExpired(card.expDate))
                    Text(
                      "EXPIRED",
                      style: AppTextStyles.kCardTitle
                          .copyWith(color: kTextRedColor),
                    ),
                ],
              ),
            ],
          ),
        ),
        // Clickable
        if (isClickable)
          Container(
            padding: const EdgeInsets.all(kDefaultPadding * 2.3),
            width: width,
            height: height,
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.secondary,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              borderRadius: kHugeBorderRadius,
              radius: kInkWellMediumRadius,
              onTap: () => // onPressed
                  AppSlidingBottomSheet(
                context: context,
                headerColor:
                    CardModel.getCardColorNullSafety(card: card, opacity: 0.85),
                bodyWidget: CardOverviewSlidingSheet(card: card),
              ).showStyledSheet(),
            ),
          ),
      ],
    );
  }

  // TODO: is it the right way to do it?
  static Widget? buildCardLogo(CardModel card) {
    if (card.cardBrand == CardBrand.mastercard) {
      return Image.asset('assets/icons/logo_master_card.png');
    } else if (card.cardBrand == CardBrand.visa) {
      return Image.asset('assets/icons/logo_visa_card.png');
    } else if (card.cardBrand == CardBrand.visaPlatinum) {
      return SvgPicture.asset(
        'assets/icons/logo_visa_card_platinum.svg',
        color: Colors.white,
      );
    }
    return null;
  }

  static Widget demoCardInfo(BuildContext context) => CardWidget(
        card: CardModel(
          cardHolderName: 'Flutter is Fun!',
          cardNumber: '1234 1234 1234 1234',
          cvv: '987',
          expDate: '10/29',
          cardColor: const Color(0xff1f8ea3),
        ),
        isClickable: true,
        onPress: () => print('Hey! CardWidget was clicked'),
      );
}

class CardOutlineWidget extends StatelessWidget {
  const CardOutlineWidget({
    Key? key,
    this.width = 350,
    this.height = 200,
    this.backgroundColor,
    this.isClickable = true,
    required this.onPress,
  }) : super(key: key);

  final double width, height;
  final Color? backgroundColor;
  final bool isClickable;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    Color? color = Theme.of(context).colorScheme.primary;

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          width: width,
          height: height,
          decoration: ShapeDecoration(
            // color: Colors.transparent,
            color: Theme.of(context).scaffoldBackgroundColor,
            shadows: [kBoxDownShadowSubtle],
            shape: RoundedRectangleBorder(
              borderRadius: kDefaultBorderRadius,
              side: BorderSide(
                width: 3,
                //color: kLightGrayColor,
                color: color,
              ),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: backgroundColor ?? Theme.of(context).primaryColorDark,
                  size: kHugeIconSize * 1.2,
                ),
                Text('Add payment method',
                    style: AppTextStyles.getBodyText(context)
                        .copyWith(color: color)),
              ],
            ),
          ),
        ),
        // Clickable
        if (isClickable)
          Container(
            padding: const EdgeInsets.all(kDefaultPadding * 2.3),
            width: width,
            height: height,
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.secondary,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              borderRadius: kHugeBorderRadius,
              radius: kInkWellMediumRadius,
              onTap: () => AppSlidingBottomSheet.demoSheet(context),
              // onTap: () => // onPressed
              //     AppSlidingBottomSheet(
              //   context: context,
              //   snappings: [0.3, 0.5],
              //   headerColor: Theme.of(context).colorScheme.secondary,
              //   bodyWidget: Container(
              //     child: Center(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               shape: const StadiumBorder(),
              //               padding: const EdgeInsets.symmetric(
              //                   horizontal: kDefaultPadding * 2),
              //             ),
              //             child: const Text('Close'),
              //             onPressed: () => Navigator.of(context).pop(),
              //           ),
              //           Container(
              //             height: 290,
              //             color: kWhiteColor,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ).showStyledSheet(),
            ),
          ),
      ],
    );
  }
}
