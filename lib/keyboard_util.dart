import 'package:flutter/material.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      FocusManager.instance.primaryFocus?.unfocus(); // new
    }
  }
}
