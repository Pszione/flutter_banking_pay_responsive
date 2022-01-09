import 'package:flutter/material.dart';

import '../core.dart';
import '../../presentation/ui/ui.dart';

PageStorageBucket bucketStorageForActivityScreen = PageStorageBucket();
PageStorageBucket bucketStorageForHomeScreen = PageStorageBucket();
PageStorageBucket bucketStorageForCardScreen = PageStorageBucket();

class RouteController {
  /// '/'
  static const String routeInitialRoute = ROUTE_INITIAL_HOME;

  /// '/home
  static const String routeHomeScreen = ROUTE_HOME_SCREEN;

  /// '/cards
  static const String routeCardScreen = ROUTE_CARD_SCREEN;

  /// '/activity\_insights
  static const String routeActivityInsights = ROUTE_ACTIVITY_INSIGHTS_SCREEN;

  /// '/scan\_card
  static const String routeScanCard = ROUTE_SCAN_CARD_SCREEN;

  /// '/send\_money'
  static const String routeSendMoney = ROUTE_SEND_MONEY_SCREEN;

  /// '/settings
  static const String routeSettings = ROUTE_SETTINGS_SCREEN;

  static Route<dynamic>? onHandleRoutes(
      RouteSettings settings, BuildContext context) {
    // Getting arguments passed in while calling [Navigator.pushNamed]
    var args = settings.arguments;
    print("Route '${settings.name}' with args: $args");

    switch (settings.name) {
      case routeInitialRoute:
        return MaterialPageRoute(
          builder: (context) => G<SetupScreen>(),
          settings: settings,
          maintainState: true,
        );
      case routeActivityInsights:
        return MaterialPageRoute(
          builder: (context) => G<ActivityInsightsScreen>(),
          settings: settings,
        );
      case routeHomeScreen:
        return MaterialPageRoute(
          builder: (context) => G<HomeScreen>(),
          settings: settings,
        );
      case routeCardScreen:
        return MaterialPageRoute(
          builder: (context) => G<CardScreen>(),
          settings: settings,
        );
      case routeScanCard:
        return MaterialPageRoute(
          builder: (context) => const ScanCardScreen(),
          settings: settings,
        );
      case routeSendMoney:
        return MaterialPageRoute(
          builder: (context) => const SendMoneyScreen(),
          settings: settings,
        );
      case routeSettings:
        return MaterialPageRoute(
          builder: (context) => G<SettingsScreen>(),
          settings: settings,
        );

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const ErrorRouteScreen(), /*settings: settings*/
    );
  }

  static void popNavigationWithResult(BuildContext context, bool success) {
    Navigator.pop(context, success); // return value
  }

  static void popNavigationWithResults(BuildContext context, dynamic results) {
    Navigator.pop(context, results); // return value
  }
}
