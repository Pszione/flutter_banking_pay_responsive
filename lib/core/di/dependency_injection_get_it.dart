import 'package:flutter_banking_pay_responsive/screens/googleAccountDialogScreen/google_account_dialog_controller.dart';
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
}
