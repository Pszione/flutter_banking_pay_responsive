import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';

import '../layers/layers.dart';
import '../presentation/ui/ui.dart';

class QuickActionsCustom {
  final quickActionsInstance = const QuickActions();

  void initializeDelayed(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 200));

    // if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
    if (!WebProvider.isWebPlatform) {
      quickActionsInstance.setShortcutItems([
        ShortcutItem(
          type: QuickActionState.search.toString(),
          // localizedTitle: 'Search',
          localizedTitle: S.of(context).quickActions_first_title,
          icon: 'quick_search',
        ),
        ShortcutItem(
          type: QuickActionState.transactionsOptions.toString(),
          // localizedTitle: 'New Transaction',
          localizedTitle: S.of(context).quickActions_second_title,
          icon: 'quick_read_more',
        ),
        ShortcutItem(
          type: QuickActionState.activity.toString(),
          // localizedTitle: 'Recent Activities',
          localizedTitle: S.of(context).quickActions_third_title,
          icon: 'quick_chart_outline',
        ),
        // PS: iOS icons not setup in Runner/Xcode
      ]);
    }

    await Future.delayed(const Duration(milliseconds: 200));

    /// Should run only on Android and iOS | macOS?
    if (!WebProvider.isWebPlatform) {
      quickActionsInstance.initialize((String type) {
        if (type == QuickActionState.search.toString()) {
          Provider.of<SetupScreen>(context, listen: false)
              .keyScreen
              .currentState
              ?.changeSelectedMenuByState(MenuState.home);
          Provider.of<HomeScreen>(context, listen: false)
              .keyValueScreen
              .value
              .openCloseStateSearch
              .value = true;
          print("Should've open search bar");
        } else if (type == QuickActionState.transactionsOptions.toString()) {
          Provider.of<SetupScreen>(context, listen: false)
              .keyScreen
              .currentState
              ?.changeSelectedMenuByState(MenuState.home);
          Provider.of<HomeScreen>(context, listen: false)
              .keyValueScreen
              .value
              .openFAB_quickAction();
          print("Should've open FAB");
        } else if (type == QuickActionState.activity.toString()) {
          Provider.of<SetupScreen>(context, listen: false)
              .keyScreen
              .currentState
              ?.changeSelectedMenuByState(MenuState.insights);
          print("Should've changed to ActivityInsightsScreen");
        }
      });
    }
  }
}
