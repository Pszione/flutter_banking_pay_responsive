import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AppThemes {
  static ColorScheme kLightColorScheme = const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    primaryVariant: kPrimaryColor,
    secondaryVariant: kComplementaryColor,
    surface: kWhiteColor,
    // onSurface: kDarkColor,
    background: kWhiteColor,
    surfaceVariant: kBackgroundColor,
    inverseSurface: kGrayColor,
    error: kErrorColor,
  );
  static ColorScheme kDarkColorScheme = const ColorScheme.dark(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    primaryVariant: kPrimaryColor,
    secondaryVariant: kComplementaryColor,
    surface: kDarkBackgroundColor,
    // onSurface: kWhiteColor,
    background: kDarkBackgroundColor,
    surfaceVariant: kDarkBackgroundColor,
    inverseSurface: kDarkShimmerColor,
    error: kErrorColor,
  );

  static ThemeData kLightThemeData() => appMainThemeData(kLightColorScheme);

  static ThemeData kDarkThemeData() =>
      appMainThemeData(kDarkColorScheme).copyWith(
        hoverColor: Colors.black26,
      );

  static ThemeData appMainThemeData(ColorScheme scheme) => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: scheme.surface,
          centerTitle: true,
          titleSpacing: kSmallPadding,
          elevation: 0,
          iconTheme: IconThemeData(
            color: scheme.onSurface,
            size: kMediumIconSize,
          ),
        ),
        iconTheme: IconThemeData(
          color: scheme.onSurface,
          size: kMediumIconSize,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: scheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              kSmallBorderRadiusAsDouble,
            ),
          ),
          elevation: 8,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            primary: scheme.primary,
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
          // backgroundColor: Theme.of(context).colorScheme.background,
        ),
        colorScheme: scheme,
        primaryColor: scheme.surface,
        primaryColorDark: scheme.onSurface,
        primaryColorLight: scheme.inverseSurface,
        scaffoldBackgroundColor: scheme.surfaceVariant,
        backgroundColor: scheme.surfaceVariant,
        dialogBackgroundColor: scheme.secondary,
        // highlightColor: ,
        focusColor: Colors.transparent,
        splashColor: scheme.secondary,
        // hoverColor: Colors.white26,
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
