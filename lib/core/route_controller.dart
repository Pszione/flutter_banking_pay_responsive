import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/screens/errorRouteScreen/error_route_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/scanCardScreen/scan_card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/settingsScreen/settings_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen.dart';

class RouteController {
  /// '/'
  static const String routeInitialRoute = '/';

  /// '/scan\_card
  static const String routeScanCard = '/scan_card';

  /// '/settings
  static const String routeSettings = '/settings';

  /// '/recent\_opened\_policies'
  static const String routeRecentOpenedPolicies = '/recent_opened_policies';

  static Route<dynamic>? onHandleRoutes(
      RouteSettings settings, BuildContext context) {
    // Getting arguments passed in while calling [Navigator.pushNamed]
    var args = settings.arguments;
    print("Route '${settings.name}' with args: $args");

    switch (settings.name) {
      case routeInitialRoute:
        return MaterialPageRoute(builder: (context) => SetupScreen());
      case routeScanCard:
        return MaterialPageRoute(builder: (context) => const ScanCardScreen());
      case routeSettings:
        // MyApp.handleSystemUIColor(
        //     context, null); // TODO: context does not have ThemeData
        return MaterialPageRoute(builder: (context) => const SettingsScreen());

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (context) => const ErrorRouteScreen());
  }

  static void popNavigationWithResult(BuildContext context, bool success) {
    Navigator.pop(context, success); // return value
  }

  static void popNavigationWithResults(BuildContext context, dynamic results) {
    Navigator.pop(context, results); // return value
  }
}
