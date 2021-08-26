import 'package:flutter/material.dart';
import 'constants.dart';

class AppTextStyle {
  //AppTextStyle({required SizeConfig sizes});
  //SizeConfig _sizes;

  static TextStyle kBodyText = TextStyle(
    color: kTextBodyColor, // kPrimaryColor
    fontWeight: FontWeight.w700,
    fontSize: 20,
    //fontSize: sizes.getProportionateScreenWidth(20),
  );

  static TextStyle kMenuTitle = TextStyle(
    color: kPrimaryColor, // kPrimaryColor
    fontWeight: FontWeight.w600,
    fontSize: 20,
    //fontSize: SizeConfig().getProportionateScreenWidth(20),
  );

  static TextStyle kCardTitle = TextStyle(
    color: kTertiaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    //fontSize: SizeConfig().getProportionateScreenWidth(16),
  );

  static TextStyle kCardSubtitle = TextStyle(
    color: kWhiteColor,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    //fontSize: SizeConfig().getProportionateScreenWidth(18),
  );

  static TextStyle kListTileTitle = TextStyle(
    color: kTextBodyColor, // kPrimaryColor
    fontSize: 20,
    //fontSize: SizeConfig().getProportionateScreenWidth(20),
  );

  static TextStyle kListTileSubtitle = TextStyle(
    color: kTextBodyColor, // kPrimaryColor
    fontSize: 15,
    //fontSize: SizeConfig().getProportionateScreenWidth(15),
  );
}

// Duplicates
const TextStyle kCardTitleStyle =
    TextStyle(color: kTertiaryColor, fontWeight: FontWeight.w700, fontSize: 16);
const TextStyle kCardSubtitle =
    TextStyle(color: kWhiteColor, fontWeight: FontWeight.w700, fontSize: 18);
