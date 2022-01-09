import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core.dart';
import '../layers/layers.dart';
import '../presentation/ui/ui.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // initialize instances
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => G<ThemeProvider>(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => G<SettingsProvider>(),
        ),
        ChangeNotifierProvider<DBSyncProvider>(
          create: (_) => G<DBSyncProvider>(),
        ),
        ChangeNotifierProvider<SetupScreenObservable>(
          create: (_) => SetupScreenObservable(),
        ),
        ChangeNotifierProvider<NavigationBarShared>(
          create: (_) => G<NavigationBarShared>(),
        ),
        //
        ChangeNotifierProvider<SetupScreen>(
          create: (_) => G<SetupScreen>(),
        ),
        ChangeNotifierProvider<HomeScreen>(
          create: (_) => G<HomeScreen>(),
        ),
        ChangeNotifierProvider<CardScreen>(
          create: (_) => G<CardScreen>(),
        ),
        ChangeNotifierProvider<ActivityInsightsScreen>(
          create: (_) => G<ActivityInsightsScreen>(),
        ),
      ],
      child: child,
    );
  }
}
