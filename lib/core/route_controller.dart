import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/errorRouteScreen/error_route_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/homeScreen/home_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/scanCardScreen/scan_card_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/sendMoneyScreen/send_money_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/settingsScreen/settings_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/setupScreen/setup_screen.dart';
import 'package:get_it/get_it.dart';

class RouteController {
  /// '/'
  static const String routeInitialRoute = '/';

  /// '/home
  static const String routeHomeScreen = '/home';

  /// '/cards
  static const String routeCardScreen = '/cards';

  /// '/activity\_insights
  static const String routeActivityInsights = '/activity_insights';

  /// '/scan\_card
  static const String routeScanCard = '/scan_card';

  /// '/send\_money'
  static const String routeSendMoney = '/send_money';

  /// '/settings
  static const String routeSettings = '/settings';

  static Route<dynamic>? onHandleRoutes(
      RouteSettings settings, BuildContext context) {
    // Getting arguments passed in while calling [Navigator.pushNamed]
    var args = settings.arguments;
    print("Route '${settings.name}' with args: $args");

    switch (settings.name) {
      case routeInitialRoute:
        return MaterialPageRoute(
          builder: (context) => GetIt.I<SetupScreen>(),
          settings: settings,
          maintainState: true,
        );
      case routeActivityInsights:
        return MaterialPageRoute(
          builder: (context) => GetIt.I<ActivityInsightsScreen>(),
          settings: settings,
        );
      case routeHomeScreen:
        return MaterialPageRoute(
          builder: (context) => GetIt.I<HomeScreen>(),
          settings: settings,
        );
      case routeCardScreen:
        return MaterialPageRoute(
          builder: (context) => GetIt.I<CardScreen>(),
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
          builder: (context) => GetIt.I<SettingsScreen>(),
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
