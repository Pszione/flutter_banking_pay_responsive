import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen.dart';
import 'package:flutter_banking_pay_responsive/theme_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // initialize instance
      builder: (context, _) => MaterialApp(
        title: 'Banking Pay',
        debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.system,
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        theme: AppThemes.lightThemeData,
        darkTheme: AppThemes.darkThemeData,
        home: SetupScreen(),
      ),
    );
  }
}

class AppThemes {
  static ColorScheme appColorScheme = const ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    //primaryVariant:
    //secondaryVariant: ,
    surface: kWhiteColor,
    background: kWhiteColor,
  );
  static ColorScheme appDarkColorScheme = const ColorScheme.dark(
    primary: kPrimaryColor,
    secondary: kPrimaryColor,
    primaryVariant: kPrimaryColor,
    secondaryVariant: kPrimaryColor,
    surface: kDarkBackgroundColor,
    background: kDarkBackgroundColor,
  );

  static final ThemeData lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: kWhiteColor,
      elevation: 0,
    ),
    colorScheme: AppThemes.appColorScheme,

    scaffoldBackgroundColor: kBackgroundColor, // kWhiteColor
    // primarySwatch: createMaterialColor(kComplementaryColor),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static final ThemeData darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkBackgroundColor,
      elevation: 0,
    ),
    colorScheme: AppThemes.appDarkColorScheme,

    scaffoldBackgroundColor: kDarkBackgroundColor,
    // primarySwatch: createMaterialColor(kComplementaryColor),
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  MaterialColor createMaterialColor(Color color) {
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
