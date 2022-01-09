import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../main.dart';
import 'constants.dart';

Future<void> handleFullscreenSystemUIMode(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 500));

// SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//     overlays: [SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Theme.of(context).colorScheme.background,
    systemNavigationBarColor: Theme.of(context).colorScheme.background,
    systemNavigationBarDividerColor: Theme.of(context).colorScheme.background,
    systemStatusBarContrastEnforced: true,
    systemNavigationBarContrastEnforced: true,
  ));

// SystemChrome.setSystemUIChangeCallback((isUiVisible) async {
//   if (isUiVisible) {
//     return;
//   }
//   await Future.delayed(const Duration(milliseconds: 3000));
//   SystemChrome.restoreSystemUIOverlays();
// });
}

Future<void> handleSystemUIColor(BuildContext context, Color? newColor) async {
  await Future.delayed(const Duration(milliseconds: 100));

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: newColor ?? Theme.of(context).colorScheme.background,
      systemNavigationBarColor:
          newColor ?? Theme.of(context).colorScheme.background,
      systemNavigationBarDividerColor: Theme.of(context).colorScheme.background,
      systemStatusBarContrastEnforced: true,
      systemNavigationBarContrastEnforced: true,
    ),
  );
}

Future changeWebAppTabName({
  required String? label,
  String title = kAPP_TITLE,
}) async {
  var _finalName = label != null ? '$label - $title' : kAPP_TITLE;

  return await SystemChrome.setApplicationSwitcherDescription(
    ApplicationSwitcherDescription(
        label: _finalName, primaryColor: kSecondaryColor.value),
  );
}
