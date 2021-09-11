import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'dart:core';

import 'package:flutter_banking_pay_responsive/models/card_brand.dart';
import 'package:flutter_banking_pay_responsive/models/i_card_implementation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import 'app_sliding_bottom_sheet.dart';

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
            color: getCardColor(true),
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
                            style: !hasCardExpired(card.expDate)
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
                  if (hasCardExpired(card.expDate))
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
              enableFeedback: true,
              onTap: () => AppSlidingBottomSheet(
                context: context,
                bodyWidget: Material(
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 2),
                          ),
                          child: const Text('Close'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Builder(
                            // sheetController needs a builder around it to get the right context
                            builder: (context) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding * 2),
                            ),
                            child: const Text('Show more'),
                            onPressed: () =>
                                SheetController.of(context)!.expand(),
                          );
                        }),
                        Container(
                          width: double.infinity,
                          height: 350,
                          color: kTertiaryColor,
                        ),
                        Container(
                          width: double.infinity,
                          height: 350,
                          color: kPrimaryColor,
                        ),
                        Container(
                          width: double.infinity,
                          height: 350,
                          color: kDarkColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ).showStyledSheet(),
              // onTap: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //         const ActivityInsightsScreen(),
              //   ),
              // ),
            ),
          ),
      ],
    );
  }

  Widget? buildCardLogo() {
  Color getCardColor(bool withOpacity) {
    Color selectedColor = card.cardColor ?? Colors.black45;
    return withOpacity ? selectedColor.withOpacity(0.8) : selectedColor;
  }

  static Color getCardColorNullSafety(CardModel card) {
    if (card.cardColor != null) {
      if (card.cardColor == Colors.white) {
        return kGrayColor;
      } else {
        return card.cardColor!.withOpacity(0.9);
      }
    }
    return Colors.black;
  }

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

  static String? getCardNickname(CardModel card) {
    return card.nickname ?? card.cardNumber;
  }

  static bool hasCardExpired(String? expDate) {
    if (expDate == null || expDate.isEmpty) {
      return true; // warning
    } else if (expDate.contains('/')) {
      var currentYear = DateTime.now();
      var expMonth = expDate.split('/').first;
      var expYear = expDate.split('/').last;

      var cardDate = expYear.length <= 2
          ? DateTime(2000 + int.parse(expYear), int.parse(expMonth))
          : DateTime(int.parse(expYear), int.parse(expMonth));

      return cardDate.isBefore(currentYear);
    }
    return false;
  }
}
