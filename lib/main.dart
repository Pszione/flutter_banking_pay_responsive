import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // initialize instances
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider()),
        ChangeNotifierProvider<DBSyncProvider>(
          create: (_) => DBSyncProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Banking Pay',
          debugShowCheckedModeBanner: false,
          // themeMode: ThemeMode.system,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          theme: AppThemes.lightThemeData,
          darkTheme: AppThemes.darkThemeData,
          //home: const SetupScreen(),
          home: buildFuture(),
        );
      }),
    );
  }

  Future<String?> _fetchNetworkData(int milliseconds) {
    final myFuture =
        Future<String?>.delayed(Duration(milliseconds: milliseconds), () {
      print('future finished');
      return 'Success: Future.delayed for $milliseconds';
    });
    // .then((value) => print('Whaaaaat? 2'));
    return myFuture;
  }

  buildFuture() {
    return Material(
      type: MaterialType.canvas,
      child: FutureBuilder<String?>(
        // it's an async build method
        future: _fetchNetworkData(2500),
        builder: (context, httpSnapshot) {
          print(httpSnapshot.data.runtimeType);
          print(httpSnapshot.data.toString());
          // Checking future result
          if (httpSnapshot.hasError) {
            print(httpSnapshot.error);
            return Center(child: Text(httpSnapshot.error.toString()));
          }
          // Success
          else if (httpSnapshot.hasData) {
            print(httpSnapshot.data);
            return const SetupScreen();
          }
          //
          return Center(
              child: CircularProgressIndicator(
                  strokeWidth: 6,
                  color: Theme.of(context).colorScheme.primary));
          // return const Center(
          //     child: Text('Loading...',
          //         style: TextStyle(decoration: TextDecoration.none)));
        },
      ),
    );
  }
}

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
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble)),
      elevation: 8,
      //extendedTextStyle: TextStyle(color: Theme.of(context).primaryColorDark),
    ),
    cardTheme: CardTheme(
      elevation: 0,
      //clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
      ),
      color: Colors.transparent,
    ),
    colorScheme: AppThemes.appColorScheme,
    primaryColor: kWhiteColor,
    primaryColorDark: kDarkColor,
    scaffoldBackgroundColor: kBackgroundColor,
    backgroundColor: kBackgroundColor,
    dialogBackgroundColor: kSecondaryColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
  );

  static final ThemeData darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: kDarkBackgroundColor,
      centerTitle: true,
      elevation: 0,
      //clipBehavior: Clip.antiAlias,
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
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble)),
      elevation: 8,
    ),
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
      ),
      color: Colors.transparent,
    ),
    colorScheme: AppThemes.appDarkColorScheme,
    primaryColor: kDarkBackgroundColor,
    primaryColorDark: kWhiteColor,
    scaffoldBackgroundColor: kDarkBackgroundColor,
    backgroundColor: kDarkBackgroundColor,
    dialogBackgroundColor: kSecondaryColor,
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
