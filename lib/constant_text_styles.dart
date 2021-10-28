import 'package:flutter/material.dart';
import 'constants.dart';

class AppTextStyles {
  const AppTextStyles();

  static TextStyle kNavigationBarText = const TextStyle(fontSize: 14);

  static TextStyle kNavigationBarSelectedText = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.4);

  static TextStyle kFloatingButtonText() => const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      );

  //
  static TextStyle getBodyText(BuildContext context) =>
      Theme.of(context).textTheme.headline5!.copyWith(
            // color: kTextBodyColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: 1,
            //fontSize: sizes.getProportionateScreenWidth(20),
          );

  static TextStyle kMenuTitle(BuildContext context) => TextStyle(
        color: Theme.of(context).primaryColorDark, // kPrimaryColor
        fontWeight: FontWeight.w600,
        fontSize: 20,
        //fontSize: SizeConfig().getProportionateScreenWidth(20),
      );

  static TextStyle kCardTitle = TextStyle(
    color: kTertiaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    shadows: [kTextBoxShadowSubtle],
    letterSpacing: 1.0,
    //fontSize: SizeConfig().getProportionateScreenWidth(16),
  );

  static TextStyle kCardSubtitle = const TextStyle(
    // TODO: depending on card color not able to read it
    // color: kWhiteColor,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    //fontSize: SizeConfig().getProportionateScreenWidth(18),
  );

  static TextStyle kListTileTitle = const TextStyle(
    // color: kTextBodyColor,
    fontSize: 19,
    fontWeight: FontWeight.w600,
    //fontSize: SizeConfig().getProportionateScreenWidth(20),
  );

  static TextStyle kListTileSubtitle = const TextStyle(
    // color: kTextBodyColor,
    fontSize: 15,
    //fontSize: SizeConfig().getProportionateScreenWidth(15),
  );

  static TextStyle kSmallWhiteSubtitle(BuildContext context) => TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 15,
      );

  static TextStyle kSmallBoldText() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: kTextSmallHeightSpacing,
        letterSpacing: 0.3,
      );

  static TextStyle kSmallText() => const TextStyle(
        fontSize: 12, height: kTextSmallHeightSpacing * 0.95,
        //color: Theme.of(context).colorScheme.onBackground,
      );
}
