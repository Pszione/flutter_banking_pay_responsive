import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shimmer/shimmer.dart';

import 'core/core.dart';
import 'layers/layers.dart';
import 'presentation/ui/ui.dart';

const kAPP_TITLE = 'Flutter Banking Pay';
const kAPP_TITLE_SHORT = 'Banking Pay';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
      child: Builder(builder: (context) {
        return MaterialApp(
          title: kAPP_TITLE,
          restorationScopeId: 'app',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          scrollBehavior: ScrollBehaviorGesturesCustom(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          // themeMode: ThemeMode.system,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          theme: AppThemes.lightThemeData,
          darkTheme: AppThemes.darkThemeData,
          initialRoute: ROUTE_INITIAL,
          onGenerateRoute: (settings) =>
              RouteController.onHandleRoutes(settings, context),
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
