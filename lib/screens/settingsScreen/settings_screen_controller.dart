import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/models/settings_texts.dart';
import 'package:flutter_banking_pay_responsive/snackbar_errors.dart';

import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/utils.dart';
import 'package:get_it/get_it.dart';

enum SettingsEnum01 { APP, NFC }

class SettingsScreenController {
  final SettingsProvider settingsProvider = SettingsProvider();
  // TODO: Provider.of<SettingsProvider>(context); without context

  final SettingsTexts settingsLocalization =
      SettingsTexts(l10nInstance: S.current);

  String? getGoogleAvatarThumbnail() =>
      GetIt.I<DBSyncProvider>().user.avatarThumbnail;
  // Provider.of<DBSyncProvider>(context, listen: false).user.avatarThumbnail

  void launchUrlGoogleAccount() {
    Https.launchURL(url: 'https://myaccount.google.com/', forceWebView: false);
  }

  Future<void> callPlatformSettings(
      BuildContext context, SettingsEnum01 method) async {
    if (!WebProvider.isWebPlatform) {
      switch (method) {
        case SettingsEnum01.APP:
          return await AppSettings.openAppSettings();
        case SettingsEnum01.NFC:
          return await AppSettings.openNFCSettings();
        default:
          debugPrint('error $SettingsEnum01');
      }
    }
    AppSnackBarErrors.showSnackBarFeatureUnavailable(context);
  }
}
