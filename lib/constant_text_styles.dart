import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/size_config.dart';
import 'constants.dart';

class AppTextStyle {
  static TextStyle kCardTitle = TextStyle(
      color: kTertiaryColor,
      fontWeight: FontWeight.w700,
      fontSize: SizeConfig().getProportionateScreenWidth(16));

  static TextStyle kCardSubtitle = TextStyle(
      color: kWhiteColor,
      fontWeight: FontWeight.w700,
      fontSize: SizeConfig().getProportionateScreenWidth(18));

  static TextStyle kBodyText = TextStyle(
      color: kTextBodyColor, // kPrimaryColor
      fontWeight: FontWeight.w700,
      fontSize: SizeConfig().getProportionateScreenWidth(20));

  static TextStyle kListTileTitle = TextStyle(
      color: kTextBodyColor, // kPrimaryColor
      fontSize: SizeConfig().getProportionateScreenWidth(20));

  static TextStyle kListTileSubtitle = TextStyle(
      color: kTextBodyColor, // kPrimaryColor
      fontSize: SizeConfig().getProportionateScreenWidth(15));
}

// Duplicates
const TextStyle kCardTitleStyle =
    TextStyle(color: kTertiaryColor, fontWeight: FontWeight.w700, fontSize: 16);
const TextStyle kCardSubtitle =
    TextStyle(color: kWhiteColor, fontWeight: FontWeight.w700, fontSize: 18);
