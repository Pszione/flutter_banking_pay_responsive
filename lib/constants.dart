import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF1A73E9);
const kSecondaryColor = Color(0xffff7b67);
const kTertiaryColor = Color(0xfffcd76b);
const kComplementaryColor = Color(0xff00444f);
const kBackgroundColor = Color(0xfffff4ec); // Color(0xFFDBFFFB)
const kDarkBackgroundColor = Color(0xff343a44);
const kDarkColor = Color(0xFF191923);
const kWhiteColor = Colors.white;
const kGrayColor = Color(0xFFD8D8D8);
const kTextBodyColor = kComplementaryColor;
const kTextWhiteColor = Colors.white;
const kTextGrayColor = Colors.grey;
Color kTextRedColor = Colors.red.shade400;

const kTextHighHeightSpacing = 1.5;
const kTextMediumHeightSpacing = 1.35;
const kTextSmallHeightSpacing = 1.0;

const kHugePadding = 33.0;
const kDefaultPadding = 20.0;
const kHalfPadding = kDefaultPadding / 2;
const kMediumPadding = kDefaultPadding / 1.5;
const kSmallPadding = kDefaultPadding / 3;

const kMaxWebsiteWidth = 1440.0; // max width of our web
const kMediumIconSize = 28.0;
const kHugeIconSize = 36.0;
var kDefaultBorderRadius = BorderRadius.circular(kDefaultBorderRadiusAsDouble);
const kDefaultBorderRadiusAsDouble = 20.0;
var kHugeBorderRadius = BorderRadius.circular(28);

var kBoxDownShadowSubtle = BoxShadow(
  offset: const Offset(0.0, 6.0),
  color: kDarkColor.withOpacity(0.2),
  spreadRadius: 1,
  blurRadius: 2,
);

const kDefaultDuration = Duration(milliseconds: 700);
