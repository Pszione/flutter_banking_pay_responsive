import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';

const kPrimaryColor = Color(0xFF1A73E9);
const kSecondaryColor = Color(0xffff7b67);
const kTertiaryColor = Color(0xfffcd76b);
const kComplementaryColor = Color(0xff00444f);
const kBackgroundColor = Color(0xfffff4ec); // Color(0xFFDBFFFB)
const kLightShimmerColor = Color(0xFFE6E0DA); // Color(0xFFD6CDCD);
const kDarkBackgroundColor = Color(0xff343a44);
const kDarkShimmerColor = Color(0xff394655);
const kWhiteColor = Colors.white;
const kDarkColor = Color(0xFF191923);
const kGrayColor = Color(0xFFD8D8D8);
Color kLightGrayColor = Colors.grey[300]!;
const kErrorColor = Color(0xffffa856);
const kAlertOverlayOpacity = 0.70; // 70%

const kTextBodyColor = kComplementaryColor;
const kTextWhiteColor = Colors.white;
const kTextGrayColor = Colors.grey;
Color kTextRedColor = Colors.red.shade400;
const kTextHighHeightSpacing = 1.5;
const kTextMediumHeightSpacing = 1.35;
const kTextSmallHeightSpacing = 1.0;

const kHugePadding = 33.0;
const kDefaultPadding = 20.0;
const kDefaultRowSpacing = kDefaultPadding * 1.5;
const kHalfPadding = kDefaultPadding / 2;
const kMediumPadding = kDefaultPadding / 1.5;
const kSmallPadding = kDefaultPadding / 3;
const kFloatingButtonLocation = FloatingActionButtonLocation.centerFloat;

FloatingActionButtonLocation kFloatingButtonLocationAdaptive(
        BuildContext context) =>
    Responsive.isTablet(context)
        ? FloatingActionButtonLocation.endFloat
        : FloatingActionButtonLocation.centerFloat;
FloatingActionButtonLocation kFloatingButtonLocationFixed(
        BuildContext context) =>
    FloatingActionButtonLocation.endFloat;

const kMaxDesktopWidth = 1440.0; // max width of our web
const kMaxButtonConstraintWidth = 630.0;
double kBottomNavigationHeight(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait
        ? AppBar().preferredSize.height * 1.6
        : AppBar().preferredSize.height * 1.2;

const kFabIconSize = kHugeIconSize * 1.5;
const kHugeIconSize = 33.0;
const kMediumIconSize = 27.0;
const kSmallIconSize = 22.0;
const kSmallIconSize02 = 15.0;
const kVerySmallIconSize = 10.0;
const kInkWellMediumRadius = 90.0;
var kHugeBorderRadius = BorderRadius.circular(28);
var kDefaultBorderRadius = BorderRadius.circular(kDefaultBorderRadiusAsDouble);
const kDefaultBorderRadiusAsDouble = 20.0;
const kSmallBorderRadiusAsDouble = 16.0;

var kBoxDownShadowSubtle = BoxShadow(
  offset: const Offset(0.0, 5.5),
  color: kDarkColor.withOpacity(0.2),
  spreadRadius: 1,
  blurRadius: 1.6,
);

var kTextBoxShadowSubtle = BoxShadow(
  offset: const Offset(0.5, 1.4),
  color: kDarkColor.withOpacity(0.6),
  spreadRadius: 1.4,
  blurRadius: 1.5,
);

var kDivider = const Divider(thickness: 2, height: 0);
const K_GOOGLE_TEXT = 'Google';

const kDefaultDuration = Duration(milliseconds: 700);
const kShorterDuration = Duration(milliseconds: 320);

// You can get the status bar height with MediaQuery.of(context).padding.top,
// the keyboard height with MediaQuery.of(context).viewInsets.bottom

// *Settings
const ksMaxRecentTransactionsCount = 6;
