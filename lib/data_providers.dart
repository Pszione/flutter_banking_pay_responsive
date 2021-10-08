import 'package:flutter/material.dart';

import 'models/account.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system; // default mode

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // this them update our UI
    //print(themeMode.toString());
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

class SettingsProvider extends ChangeNotifier {
  List<bool?> options = [true, false, null, true, true, true, null, null];
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

  void invertOptionValue(int index) {
    if (isValidIndex(index)) {
      changeOption(index, options[index] ?? false); // opposite
    } else {
      print('error: index $index is out of bounds');
    }
  }
}

class DBSyncProvider extends ChangeNotifier {
  final AccountModel _user = myAccounts[0];
  int _newNotifications = 5;

  int get newNotifications => _newNotifications;
  AccountModel get user => _user;

  void markNotificationsAsRead() {
    _newNotifications = 0; // reset
    notifyListeners();
  }

  void incrementCounterDebug() {
    _newNotifications++;
    notifyListeners();
    print('notification number is $_newNotifications');
  }
}
