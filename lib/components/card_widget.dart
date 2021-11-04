import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'dart:core';

import 'package:flutter_banking_pay_responsive/models/card_brand.dart';
import 'package:flutter_banking_pay_responsive/models/i_card_implementation.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  static SizedBox defaultDimension =
      const SizedBox(width: 350 / 2, height: 200);

  @override
  late CardModel card;
  @override
  late double width, height;
  @override
  late bool isClickable;
  @override
  late GestureTapCallback onPress;

  static const EdgeInsets _borderPadding = EdgeInsets.all(kDefaultPadding);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Semantics(
          // TODO: card 1 out of 5 - add index in parent?
          label: S.of(context).cardWidget_singularCard_title +
              S
                  .of(context)
                  .navigation_TOOTIP_listCount_description(1, myCards.length),
          onTapHint: S.of(context).cardWidget_TOOLTIP_cardOnTapHint,
          child: Container(
            padding: _borderPadding,
            width: width,
            height: height,
            decoration: BoxDecoration(
              color:
                  CardModel.getCardColorNullSafety(card: card, opacity: 0.85),
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
                        ExcludeSemantics(
                          child: Text(
                            S.of(context).cardWidget_cardName_title,
                            style: AppTextStyles.kCardTitle,
                          ),
                        ),
                        Text(
                          '${card.cardHolderName}',
                          style: AppTextStyles.kCardSubtitle,
                        ),
                      ],
                    ),
                    Semantics(
                      child: Text(
                        CardModel.obscureCardInfo(card.cardNumber!, 4),
                        style: AppTextStyles.kCardSubtitle,
                        semanticsLabel: S
                            .of(context)
                            .cardWidget_TOOLTIP_cardNumber_title(
                                CardModel.substringCardInfo(
                                    card.cardNumber!, 4)),
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).cardWidget_expDate_title,
                              style: AppTextStyles.kCardTitle,
                              semanticsLabel:
                                  S.of(context).cardWidget_expDate_description,
                            ),
                            Text(
                              '${card.expDate}',
                              style: !CardModel.hasCardExpired(card.expDate)
                                  ? AppTextStyles.kCardSubtitle
                                  : AppTextStyles.kCardSubtitle
                                      .copyWith(color: kTextRedColor),
                              semanticsLabel:
                                  "${CardModel.parseExpDateStringToDateTime(card.expDate)?.month} ${CardModel.parseExpDateStringToDateTime(card.expDate)?.year} ${CardModel.hasCardExpired(card.expDate) ? S.of(context).cardWidget_expDateExpired_title : null}",
                            ),
                          ],
                        ),
                        const SizedBox(width: kDefaultPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Semantics(
                              child: Text(
                                S.of(context).cardWidget_cvvNumber_title,
                                style: AppTextStyles.kCardTitle,
                                semanticsLabel: S
                                    .of(context)
                                    .cardWidget_cvvNumber_description,
                              ),
                              hint: S
                                  .of(context)
                                  .cardWidget_TOOLTIP_cvvNumber_hint,
                            ),
                            ExcludeSemantics(
                              child: Text(
                                CardModel.obscureCardInfo(card.cvv ?? '', 1),
                                style: CardModel.hasCardExpired(card.expDate) ==
                                        false
                                    ? AppTextStyles.kCardSubtitle
                                    : AppTextStyles.kCardSubtitle
                                        .copyWith(color: kTextRedColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        // Extra info aligned to the right
        Container(
          padding: _borderPadding,
          width: width,
          height: height,
          child: ExcludeSemantics(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: buildCardLogo(card),
                ),
                if (CardModel.hasCardExpired(card.expDate))
                  Text(
                    S.of(context).cardWidget_expDateExpired_title,
                    style:
                        AppTextStyles.kCardTitle.copyWith(color: kTextRedColor),
                    overflow: TextOverflow.clip,
                  ),
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
              onTap: () => onPress.call(),
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
    this.label = 'Add',
  }) : super(key: key);

  final double width, height;
  final Color? backgroundColor;
  final String? label;
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
            color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
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
            child: Semantics(
              label: label!,
              button: true,
              excludeSemantics: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColorDark,
                    size: kHugeIconSize * 1.2,
                  ),
                  if (label != null)
                    AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText(
                          label!,
                          textAlign: TextAlign.center,
                          speed: const Duration(milliseconds: 45),
                          textStyle: AppTextStyles.getBodyText(context)
                              .copyWith(color: color, fontSize: 17),
                        ),
                      ],
                    ),
                  // Text('Add payment method',
                  //     style: AppTextStyles.getBodyText(context)
                  //         .copyWith(color: color)),
                ],
              ),
            ),
          ),
        ),
        // Clickable
        if (isClickable)
          SizedBox(
            //padding: const EdgeInsets.all(kDefaultPadding * 2.3),
            width: width,
            height: height,
            child: InkWell(
              splashColor: Theme.of(context).colorScheme.secondary,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              borderRadius: kHugeBorderRadius,
              radius: kInkWellMediumRadius,
              onTap: onPress,
              //onTap: () => AppSlidingBottomSheet.demoSheet(context),
            ),
          ),
      ],
    );
  }
}
