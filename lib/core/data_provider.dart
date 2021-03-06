import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../layers/layers.dart';
import '../presentation/ui/ui.dart';

class WebProvider {
  static get isWebPlatform => kIsWeb;
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system; // default mode

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isDark, BuildContext context) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    handleFullscreenSystemUIMode(context);
  }

  // how to use it's state
  // final currentThemeMode =
  // MediaQuery.of(context).platformBrightness == Brightness.dark
  //     ? ThemeMode.dark
  //     : ThemeMode.light;
  // OR
  // final currentThemeMode =
  // Provider.of<ThemeProvider>(context).isDarkMode
  //     ? ThemeMode.dark
  //     : ThemeMode.light;
}

class SetupScreenObservable extends ChangeNotifier {
  //
  void notifyOnWillPop() {
    notifyListeners();
  }
}

class NavigationBarShared extends ChangeNotifier {
  late final MaterialYouNavigationBarCustom _navigationBar;

  bool isInitialized = false;
  MaterialYouNavigationBarCustom? get getNavigationBar =>
      isInitialized ? _navigationBar : null;

  void init({
    required ValueNotifier<int> getCurrentIndex,
    required void Function(int) callbackOnPress,
  }) {
    if (!isInitialized) {
      _navigationBar = MaterialYouNavigationBarCustom(
        getCurrentIndex: getCurrentIndex,
        callbackOnPress: callbackOnPress,
      );
      isInitialized = true;
      notifyListeners();
    }
  }
}

class SettingsProvider extends ChangeNotifier {
  List<bool?> options = [true, false, false, null, true, true, null, null];
  // TODO: we are not using last two booleans

  bool isValidIndex(int index) => index >= 0 && index <= options.length;

  void changeOption(int index, bool state) {
    if (isValidIndex(index)) {
      options[index] = state;
      notifyListeners();

      print(options);
    } else {
      print('error: index $index is out of bounds');
    }
  }
}

class DBSyncProvider extends ChangeNotifier {
  final AccountModel _user = myAccounts[0];
  int _newNotifications = 5;
  int? _clickedTransaction;

  int get newNotifications => _newNotifications;
  int? get clickedTransactionIndex => _clickedTransaction;
  AccountModel get user => _user;

  void markNotificationsAsRead() {
    _newNotifications = 0;
    notifyListeners(); // TODO
  }

  void setClickedTransactionIndex(int index) {
    _clickedTransaction = index;

    print('Provider: clickedTransaction $_clickedTransaction'); // TODO
  }

  void clearClickedTransactionIndex() {
    _clickedTransaction = null;
  }

  void incrementCounterDebug() {
    _newNotifications++;
    notifyListeners();
    print('notification number is $_newNotifications');
  }
}
