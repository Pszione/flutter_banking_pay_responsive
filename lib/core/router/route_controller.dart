import 'package:flutter/material.dart';

import '../core.dart';
import '../../presentation/ui/ui.dart';

PageStorageBucket bucketStorageForActivityScreen = PageStorageBucket();
PageStorageBucket bucketStorageForHomeScreen = PageStorageBucket();
PageStorageBucket bucketStorageForCardScreen = PageStorageBucket();

// ignore: unused_local_variable
class RouteController {
  static Route<dynamic>? onHandleRoutes(
      RouteSettings settings, BuildContext context) {
    final args = settings.arguments;
    final routeName = settings.name;
    print("Route '${settings.name}' with args: $args");

    late Widget routeWidget;

    switch (routeName) {
      case ROUTE_INITIAL:
        routeWidget = G<SetupScreen>();
        break;
      case ROUTE_ACTIVITY_INSIGHTS_SCREEN:
        routeWidget = G<ActivityInsightsScreen>();
        break;
      case ROUTE_HOME_SCREEN:
        routeWidget = G<HomeScreen>();
        break;
      case ROUTE_CARD_SCREEN:
        routeWidget = G<CardScreen>();
        break;
      case ROUTE_SCAN_CARD_SCREEN:
        routeWidget = const ScanCardScreen();
        break;
      case ROUTE_SEND_MONEY_SCREEN:
        routeWidget = const SendMoneyScreen();
        break;
      case ROUTE_SETTINGS_SCREEN:
        routeWidget = G<SettingsScreen>();
        break;

      default:
        routeWidget = const ErrorRouteScreen();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => routeWidget,
      settings: settings,
    );
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
