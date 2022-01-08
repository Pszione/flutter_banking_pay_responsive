import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../layers/layers.dart';
import '../../presentation/widgets/widgets.dart';

enum SettingsEnum01 { APP, NFC }

class SettingsScreenController {
  final SettingsProvider settingsProvider = SettingsProvider();
  // TODO: Provider.of<SettingsProvider>(context); without context
  // TODO: Consumer<HomeScreen>(builder: (_, screen, __) => screen)

  final SettingsTexts settingsLocalization =
      SettingsTexts(l10nInstance: S.current);

  String? getGoogleAvatarThumbnail() =>
      G<DBSyncProvider>().user.avatarThumbnail;
  // Provider.of<DBSyncProvider>(context, listen: false).user.avatarThumbnail

  void launchUrlGoogleAccount() {
    HttpsService.launchURL(
      url: 'https://myaccount.google.com/',
      forceWebView: false,
    );
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
