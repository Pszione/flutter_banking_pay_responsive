import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/google_list_decorations.dart';
import 'package:flutter_banking_pay_responsive/models/settings_texts.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data_providers.dart';
import '../../utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: const AppBarComplete(
        title: 'Settings',
        hasNotifications: false,
        hasDarkThemeToggle: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: kHugePadding),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionEmailUpdates().label,
              description: SettingsTexts.optionEmailUpdates().description,
              icon: SettingsTexts.optionEmailUpdates().icon,
              switchValue: settingsProvider
                      .options[SettingsTexts.optionEmailUpdates().saveIndex!] ??
                  false,
              onPress: (bool value) =>
                  // switch automagically inverts !value
                  settingsProvider.changeOption(
                SettingsTexts.optionEmailUpdates().saveIndex!,
                value,
              ),
            ),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionPurchaseNotifications().label,
              description:
                  SettingsTexts.optionPurchaseNotifications().description,
              icon: SettingsTexts.optionPurchaseNotifications().icon,
              switchValue: settingsProvider.options[
                      SettingsTexts.optionPurchaseNotifications().saveIndex!] ??
                  false,
              onPress: (bool value) => settingsProvider.invertOptionValue(
                SettingsTexts.optionPurchaseNotifications().saveIndex!,
              ),
            ),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionTicketsUpdates().label,
              description: SettingsTexts.optionTicketsUpdates().description,
              icon: SettingsTexts.optionTicketsUpdates().icon,
              switchValue: settingsProvider.options[
                      SettingsTexts.optionTicketsUpdates().saveIndex!] ??
                  false,
              onPress: (bool value) => settingsProvider.invertOptionValue(
                SettingsTexts.optionTicketsUpdates().saveIndex!,
              ),
            ),
            buildDividerWithPadding(),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionEditAccountInfo().label,
              description: SettingsTexts.optionEditAccountInfo().description,
              icon: SettingsTexts.optionEditAccountInfo().icon,
              switchValue: settingsProvider.options[
                      SettingsTexts.optionEditAccountInfo().saveIndex!] ??
                  false,
              onPress: (bool value) {
                Https.launchURL(
                    url: 'https://myaccount.google.com/', forceWebView: false);
              },
              //
              overrideSwitchButton: buildOptionEditAccountInfo(context),
            ),
            buildDividerWithPadding(),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionShareUserLocation().label,
              description: SettingsTexts.optionShareUserLocation().description,
              icon: SettingsTexts.optionShareUserLocation().icon,
              switchValue: settingsProvider.options[
                      SettingsTexts.optionShareUserLocation().saveIndex!] ??
                  false,
              onPress: (bool value) => settingsProvider.invertOptionValue(
                SettingsTexts.optionShareUserLocation().saveIndex!,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionTravelNotice().label,
              description: SettingsTexts.optionTravelNotice().description,
              icon: SettingsTexts.optionTravelNotice().icon,
              switchValue: settingsProvider
                      .options[SettingsTexts.optionTravelNotice().saveIndex!] ??
                  false,
              onPress: (bool value) => settingsProvider.invertOptionValue(
                SettingsTexts.optionTravelNotice().saveIndex!,
              ),
            ),
            buildDividerWithPadding(),
            //
            const BuildGoogleListTitle(label: 'Advanced'),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionAppSystemSettings().label,
              description: SettingsTexts.optionAppSystemSettings().description,
              icon: SettingsTexts.optionAppSystemSettings().icon,
              switchValue: settingsProvider.options[
                      SettingsTexts.optionAppSystemSettings().saveIndex!] ??
                  false,
              onPress: (bool value) async =>
                  await AppSettings.openAppSettings(),
              //
              overrideSwitchButton: const SizedBox(),
            ),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionAppSystemNFCSettings().label,
              description:
                  SettingsTexts.optionAppSystemNFCSettings().description,
              icon: SettingsTexts.optionAppSystemNFCSettings().icon,
              switchValue: settingsProvider.options[
                      SettingsTexts.optionAppSystemNFCSettings().saveIndex!] ??
                  false,
              onPress: (bool value) async =>
                  await AppSettings.openNFCSettings(),
              //
              overrideSwitchButton: const SizedBox(),
            ),
          ],
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
          const SizedBox(height: kDefaultPadding),
          kDivider,
          const SizedBox(height: kDefaultPadding),
        ],
      );
}
