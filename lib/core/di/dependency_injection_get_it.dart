import 'package:get_it/get_it.dart';

import '../../layers/layers.dart';
import '../../presentation/ui/ui.dart';

GetIt G = GetIt.instance;

Future<void> init() async {
// dependency = objects/classes
  // *In this order! - from outside layers to inside layers
  // core services

  // datasources

  // repositories

  // controllers
  // your application may need a Singleton or Factory, you decide!
  G.registerLazySingleton<ThemeProvider>(
    () => ThemeProvider(),
  );
  G.registerLazySingleton<DBSyncProvider>(
    () => DBSyncProvider(),
  );
  G.registerLazySingleton<SettingsProvider>(
    () => SettingsProvider(),
  );
  G.registerLazySingleton<NavigationBarShared>(
    () => NavigationBarShared(),
  );
  //
  G.registerLazySingleton<SetupScreenController>(
    () => SetupScreenController(),
  );
  G.registerLazySingleton<HomeScreenController>(
    () => HomeScreenController(),
  );
  G.registerLazySingleton<CardScreenController>(
    () => CardScreenController(),
  );
  G.registerLazySingleton<ActivityInsightsScreenController>(
    () => ActivityInsightsScreenController(),
  );
  G.registerLazySingleton<GoogleAccountDialogScreenController>(
    () => GoogleAccountDialogScreenController(),
  );
  G.registerLazySingleton<SettingsScreenController>(
    () => SettingsScreenController(),
  );
  // screens
  G.registerLazySingleton<SetupScreen>(
    () => SetupScreen(),
  );
  G.registerLazySingleton<HomeScreen>(
    () => HomeScreen(),
  );
  G.registerLazySingleton<CardScreen>(
    () => CardScreen(),
  );
  G.registerLazySingleton<ActivityInsightsScreen>(
    () => ActivityInsightsScreen(),
  );
  G.registerLazySingleton<SettingsScreen>(
    () => SettingsScreen(controller: G()),
  );
}
