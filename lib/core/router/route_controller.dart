import 'package:flutter/material.dart';

import '../core.dart';
import '../../presentation/ui/ui.dart';

PageStorageBucket bucketStorageForActivityScreen = PageStorageBucket();
PageStorageBucket bucketStorageForHomeScreen = PageStorageBucket();
PageStorageBucket bucketStorageForCardScreen = PageStorageBucket();

class RouteController {
  static Route<dynamic>? onHandleRoutes(
      RouteSettings settings, BuildContext context) {
    // Getting arguments passed in while calling [Navigator.pushNamed]
    var args = settings.arguments;
    print("Route '${settings.name}' with args: $args");

    switch (settings.name) {
      case ROUTE_INITIAL:
        return MaterialPageRoute(
          builder: (context) => G<SetupScreen>(),
          settings: settings,
          maintainState: true,
        );
      case ROUTE_ACTIVITY_INSIGHTS_SCREEN:
        return MaterialPageRoute(
          builder: (context) => G<ActivityInsightsScreen>(),
          settings: settings,
        );
      case ROUTE_HOME_SCREEN:
        return MaterialPageRoute(
          builder: (context) => G<HomeScreen>(),
          settings: settings,
        );
      case ROUTE_CARD_SCREEN:
        return MaterialPageRoute(
          builder: (context) => G<CardScreen>(),
          settings: settings,
        );
      case ROUTE_SCAN_CARD_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const ScanCardScreen(),
          settings: settings,
        );
      case ROUTE_SEND_MONEY_SCREEN:
        return MaterialPageRoute(
          builder: (context) => const SendMoneyScreen(),
          settings: settings,
        );
      case ROUTE_SETTINGS_SCREEN:
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
