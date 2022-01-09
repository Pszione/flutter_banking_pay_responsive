import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppThemes {
  static ColorScheme appColorScheme = const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    primaryVariant: kPrimaryColor,
    secondaryVariant: kComplementaryColor,
    surface: kWhiteColor,
    background: kWhiteColor,
    error: kErrorColor,
  );
  static ColorScheme appDarkColorScheme = const ColorScheme.dark(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    primaryVariant: kPrimaryColor,
    secondaryVariant: kComplementaryColor,
    surface: kDarkBackgroundColor,
    background: kDarkBackgroundColor,
    error: kErrorColor,
  );

  static final ThemeData lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: kWhiteColor,
      centerTitle: true,
      titleSpacing: kSmallPadding,
      elevation: 0,
      iconTheme: IconThemeData(
        color: kDarkColor,
        size: kMediumIconSize,
      ),
    ),
    iconTheme: const IconThemeData(
      color: kDarkColor,
      size: kMediumIconSize,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          kSmallBorderRadiusAsDouble,
        ),
      ),
      elevation: 8,
      //extendedTextStyle: TextStyle(color: Theme.of(context).primaryColorDark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        primary: kPrimaryColor, // text color?
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      //clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
      ),
      color: Colors.transparent,
    ),
    dialogTheme: DialogTheme(
      // elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
      ),
      // backgroundColor: Theme.of(context).colorScheme.background, // TODO
    ),
    colorScheme: AppThemes.appColorScheme,
    primaryColor: kWhiteColor,
    primaryColorDark: kDarkColor,
    primaryColorLight: kGrayColor,
    scaffoldBackgroundColor: kBackgroundColor,
    backgroundColor: kBackgroundColor,
    dialogBackgroundColor: kSecondaryColor,
    // hoverColor: ,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static final ThemeData darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkBackgroundColor,
      centerTitle: true,
      titleSpacing: kSmallPadding,
      elevation: 0,
      iconTheme: IconThemeData(
        color: kWhiteColor,
        size: kMediumIconSize,
      ),
    ),
    iconTheme: const IconThemeData(
      color: kWhiteColor,
      size: kMediumIconSize,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          kSmallBorderRadiusAsDouble,
        ),
      ),
      elevation: 8,
      //extendedTextStyle: TextStyle(color: Theme.of(context).primaryColorDark),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        primary: kPrimaryColor, // kSecondaryColor
      ),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
      ),
      color: Colors.transparent,
    ),
    dialogTheme: DialogTheme(
      // elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
      ),
      // backgroundColor: Theme.of(context).colorScheme.background, // TODO
    ),
    colorScheme: AppThemes.appDarkColorScheme,
    primaryColor: kDarkBackgroundColor,
    primaryColorDark: kWhiteColor,
    primaryColorLight: kDarkShimmerColor,
    scaffoldBackgroundColor: kDarkBackgroundColor,
    backgroundColor: kDarkBackgroundColor,
    dialogBackgroundColor: kSecondaryColor,
    hoverColor: Colors.black26,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  MaterialColor createMaterialColor(Color color) {
    // primarySwatch: createMaterialColor(kComplementaryColor),

    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
