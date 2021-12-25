import 'package:flutter_banking_pay_responsive/screens/googleAccountDialogScreen/google_account_dialog_controller.dart';
import 'package:flutter_banking_pay_responsive/screens/settingsScreen/settings_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen.dart';
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
  getIt.registerLazySingleton<GoogleAccountDialogScreenController>(
    () => GoogleAccountDialogScreenController(),
  );
  // screens
  getIt.registerLazySingleton<SetupScreen>(
    () => SetupScreen(),
  );
  getIt.registerLazySingleton<SettingsScreen>(
    () => const SettingsScreen(),
  );
}
