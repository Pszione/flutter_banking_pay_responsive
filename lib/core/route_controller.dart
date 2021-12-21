import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/screens/errorRouteScreen/error_route_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen.dart';

class RouteController {
  /// '/'
  static const String routeInitialRoute = '/';

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

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (context) => const ErrorRouteScreen());
  }
}
