import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/core/route_controller.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

const kAPP_TITLE = 'Flutter Banking Pay';
const kAPP_TITLE_SHORT = 'Banking Pay';

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
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(),
        ),
        ChangeNotifierProvider<DBSyncProvider>(
          create: (_) => DBSyncProvider(),
        ),
        //
        ChangeNotifierProvider<SetupScreen>(
          create: (_) => SetupScreen(),
        ),
        ChangeNotifierProvider<HomeScreen>(
          create: (_) => HomeScreen(),
        ),
        ChangeNotifierProvider<CardScreen>(
          create: (_) => CardScreen(),
        ),
        ChangeNotifierProvider<ActivityInsightsScreen>(
          create: (_) => ActivityInsightsScreen(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: kAPP_TITLE,
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppCustomScrollBehavior(),
          localizationsDelegates: const [
            // 1
            S.delegate,
            // 2
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          // onGenerateTitle: (context) => S.of(context).appTitle,
          //
          // themeMode: ThemeMode.system,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          theme: AppThemes.lightThemeData,
          darkTheme: AppThemes.darkThemeData,
          // home: Builder(
          //   builder: (_) {
          //     handleFullscreenSystemUIMode(_);
          //     return buildFuture();
          //   },
          // ),
          initialRoute: RouteController.routeInitialRoute,
          onGenerateRoute: (settings) =>
              RouteController.onHandleRoutes(settings, context),
          // navigatorObservers: [], // TODO
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

  Widget buildFuture() {
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
            // Screen
            return Provider.of<SetupScreen>(context);
          }
          // Loading
          return const ShimmerHomeScreen();
        },
      ),
    );
  }

  static Future<void> handleFullscreenSystemUIMode(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).colorScheme.background,
      systemNavigationBarColor: Theme.of(context).colorScheme.background,
      systemNavigationBarDividerColor: Theme.of(context).colorScheme.background,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarContrastEnforced: true,
    ));

    // SystemChrome.setSystemUIChangeCallback((isUiVisible) async {
    //   if (isUiVisible) {
    //     return;
    //   }
    //   await Future.delayed(const Duration(milliseconds: 3000));
    //   SystemChrome.restoreSystemUIOverlays();
    // });
  }

  static Future<void> handleSystemUIColor(
      BuildContext context, Color? newColor) async {
    await Future.delayed(const Duration(milliseconds: 100));

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: newColor ?? Theme.of(context).colorScheme.background,
      systemNavigationBarColor:
          newColor ?? Theme.of(context).colorScheme.background,
      systemNavigationBarDividerColor: Theme.of(context).colorScheme.background,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarContrastEnforced: true,
    ));
  }

  static Future changeWebAppTabName(
      {required String? label, String title = kAPP_TITLE}) async {
    var _finalName = label != null ? '$label - $title' : kAPP_TITLE;
    return await SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
            label: _finalName, primaryColor: kSecondaryColor.value));
  }
}

/// The glow effect from GlowingOverscrollIndicator added by ScrollBehavior
/// To remove this effect, simply wrap any given part of your application into
/// a ScrollConfiguration with the desired ScrollBehavior
class AppScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

//
class AppCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class ShimmerProgressIndicator extends StatelessWidget {
  const ShimmerProgressIndicator({
    Key? key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  final Widget child;
  final Color? baseColor, highlightColor;

  // final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
  static isDarkMode(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark
          ? true // ThemeMode.dark
          : false; // ThemeMode.light;

  static themeDependentBaseColor(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark
          ? kDarkShimmerColor
          : kLightShimmerColor;

  @override
  Widget build(BuildContext context) {
    if (baseColor != null && highlightColor != null) {
      return Shimmer.fromColors(
        baseColor: baseColor!,
        highlightColor: highlightColor!,
        child: child,
      );
    }
    return Shimmer.fromColors(
      baseColor: themeDependentBaseColor(context),
      highlightColor: Theme.of(context).scaffoldBackgroundColor,
      child: child,
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
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble)),
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
      shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
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
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble)),
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
      shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
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
