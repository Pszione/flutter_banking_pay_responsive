import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/google_list_decorations.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/main.dart';
import 'package:flutter_banking_pay_responsive/models/settings_texts.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';
import 'package:flutter_banking_pay_responsive/snackbar_errors.dart';
import 'package:flutter_banking_pay_responsive/utils.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late SettingsTexts settingsData =
        SettingsTexts(l10nInstance: S.of(context));
    final settingsProvider = Provider.of<SettingsProvider>(context);
    MyApp.changeWebAppTabName(
        label: S.of(context).googleAccountDialog_settings_button_title);

    return Scaffold(
      appBar: AppBarComplete(
        title: S.of(context).googleAccountDialog_settings_button_title,
        hasNotificationsButton: false,
        hasDarkThemeToggle: true,
        googleAvatarThumbnail:
            Provider.of<DBSyncProvider>(context, listen: false)
                .user
                .avatarThumbnail,
      ),
      body: ResponsiveWidthConstrained(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: kHugePadding),
              BuildGoogleListSettingButton(
                label: settingsData.optionEmailUpdates().label,
                description: settingsData.optionEmailUpdates().description,
                icon: settingsData.optionEmailUpdates().icon,
                switchValue: settingsProvider
                    .options[settingsData.optionEmailUpdates().saveIndex!]!,
                onPress: (bool value) =>
                    // switch automagically inverts !value
                    settingsProvider.changeOption(
                        settingsData.optionEmailUpdates().saveIndex!, value),
              ),
              BuildGoogleListSettingButton(
                label: settingsData.optionPurchaseNotifications().label,
                description:
                    settingsData.optionPurchaseNotifications().description,
                icon: settingsData.optionPurchaseNotifications().icon,
                switchValue: settingsProvider.options[
                    settingsData.optionPurchaseNotifications().saveIndex!]!,
                onPress: (bool value) => settingsProvider.changeOption(
                    settingsData.optionPurchaseNotifications().saveIndex!,
                    value),
              ),
              BuildGoogleListSettingButton(
                label: settingsData.optionTicketsUpdates().label,
                description: settingsData.optionTicketsUpdates().description,
                icon: settingsData.optionTicketsUpdates().icon,
                switchValue: settingsProvider
                    .options[settingsData.optionTicketsUpdates().saveIndex!]!,
                onPress: (bool value) => settingsProvider.changeOption(
                    settingsData.optionTicketsUpdates().saveIndex!, value),
              ),
              buildDividerWithPadding(),
              BuildGoogleListSettingButton(
                label: settingsData.optionEditAccountInfo().label,
                description: settingsData.optionEditAccountInfo().description,
                icon: settingsData.optionEditAccountInfo().icon,
                switchValue: false,
                onPress: (bool value) {
                  Https.launchURL(
                      url: 'https://myaccount.google.com/',
                      forceWebView: false);
                },
                //
                overrideSwitchButton: buildOptionEditAccountInfo(context),
              ),
              buildDividerWithPadding(),
              BuildGoogleListSettingButton(
                label: settingsData.optionShareUserLocation().label,
                description: settingsData.optionShareUserLocation().description,
                icon: settingsData.optionShareUserLocation().icon,
                switchValue: settingsProvider.options[
                    settingsData.optionShareUserLocation().saveIndex!]!,
                onPress: (bool value) => settingsProvider.changeOption(
                    settingsData.optionShareUserLocation().saveIndex!, value),
              ),
              BuildGoogleListSettingButton(
                label: settingsData.optionTravelNotice().label,
                description: settingsData.optionTravelNotice().description,
                icon: settingsData.optionTravelNotice().icon,
                switchValue: settingsProvider
                    .options[settingsData.optionTravelNotice().saveIndex!]!,
                onPress: (bool value) => settingsProvider.changeOption(
                    settingsData.optionTravelNotice().saveIndex!, value),
              ),
              buildDividerWithPadding(),
              //
              const BuildGoogleListTitle(label: 'Advanced'),
              BuildGoogleListSettingButton(
                label: settingsData.optionAppSystemSettings().label,
                description: settingsData.optionAppSystemSettings().description,
                icon: settingsData.optionAppSystemSettings().icon,
                switchValue: false,
                onPress: (bool value) async => !WebProvider.isWebPlatform
                    ? await AppSettings.openAppSettings()
                    : AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
                //
                overrideSwitchButton: const SizedBox(),
              ),
              BuildGoogleListSettingButton(
                label: settingsData.optionAppSystemNFCSettings().label,
                description:
                    settingsData.optionAppSystemNFCSettings().description,
                icon: settingsData.optionAppSystemNFCSettings().icon,
                switchValue: false,
                onPress: (bool value) async => !WebProvider.isWebPlatform
                    ? await AppSettings.openNFCSettings()
                    : AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
                //
                overrideSwitchButton: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: is this right? Duplicate for other options?
  Padding buildOptionEditAccountInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kHalfPadding / 2),
      child: IconButton(
        icon: Icon(
          Icons.add_to_home_screen_rounded,
          size: kMediumIconSize * 1.2,
          color: Theme.of(context).primaryColorDark.withOpacity(0.65),
        ),
        onPressed: () => Https.launchURL(
            url: 'https://myaccount.google.com/', forceWebView: false),
      ),
    );
  }

  Widget buildDividerWithPadding() => Column(
        children: [
          const SizedBox(height: kHalfPadding),
          kDivider,
          const SizedBox(height: kDefaultPadding),
        ],
      );
}
