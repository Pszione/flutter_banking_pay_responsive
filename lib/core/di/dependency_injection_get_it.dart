import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/googleAccountDialogScreen/google_account_dialog.dart';
import 'package:flutter_banking_pay_responsive/screens/googleAccountDialogScreen/google_account_dialog_controller.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/settingsScreen/settings_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/settingsScreen/settings_screen_controller.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen_controller.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
// dependency = objects/classes
  // *In this order! - from outside layers to inside layers
  // core services

  // datasources

  // repositories

  // controllers
  // your application may need a Singleton or Factory, you decide!
  getIt.registerLazySingleton<DBSyncProvider>(
    () => DBSyncProvider(),
  );
  getIt.registerLazySingleton<SetupScreenController>(
    () => SetupScreenController(),
  );
  getIt.registerLazySingleton<GoogleAccountDialogScreenController>(
    () => GoogleAccountDialogScreenController(),
  );
  getIt.registerLazySingleton<SettingsScreenController>(
    () => SettingsScreenController(),
  );
  // screens
  getIt.registerLazySingleton<SetupScreen>(
    () => SetupScreen(),
  );
  getIt.registerLazySingleton<HomeScreen>(
    () => HomeScreen(),
  );
  getIt.registerLazySingleton<CardScreen>(
    () => CardScreen(),
  );
  getIt.registerLazySingleton<ActivityInsightsScreen>(
    () => ActivityInsightsScreen(),
  );
  // TODO
  // getIt.registerLazySingletonAsync(
  //   GoogleAccountDialog(key: UniqueKey())
  //       .showDialogDismissible(getIt(), getIt()),
  // );
  getIt.registerLazySingleton<SettingsScreen>(
    () => SettingsScreen(controller: getIt()),
  );
}
