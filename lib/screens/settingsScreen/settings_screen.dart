import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/google_list_decorations.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/main.dart';
import 'package:flutter_banking_pay_responsive/models/settings_texts.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';
import 'package:flutter_banking_pay_responsive/screens/settingsScreen/settings_screen_controller.dart';
import 'package:provider/provider.dart';

import '../../data_providers.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, required this.controller}) : super(key: key);

  final SettingsScreenController controller;

  @override
  Widget build(BuildContext context) {
    MyApp.changeWebAppTabName(
        label: S.of(context).googleAccountDialog_settings_button_title);
    MyApp.handleSystemUIColor(context, null);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final settingsData = SettingsTexts(l10nInstance: S.of(context));

    return Scaffold(
      appBar: AppBarComplete(
        title: S.of(context).googleAccountDialog_settings_button_title,
        hasNotificationsButton: false,
        hasDarkThemeToggle: true,
        googleAvatarThumbnail: controller.getGoogleAvatarThumbnail(),
      ),
      body: ResponsiveWidthConstrained(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: kHugePadding),
              // TODO: use List and Loop
              Builder(builder: (_) {
                var data = settingsData.optionEmailUpdates();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: settingsProvider.options[data.saveIndex!]!,
                  onPress: (bool value) =>
                      settingsProvider.changeOption(data.saveIndex!, value),
                );
              }),
              Builder(builder: (_) {
                var data = settingsData.optionPurchaseNotifications();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: settingsProvider.options[data.saveIndex!]!,
                  onPress: (bool value) =>
                      settingsProvider.changeOption(data.saveIndex!, value),
                );
              }),
              Builder(builder: (_) {
                var data = settingsData.optionTicketsUpdates();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: settingsProvider.options[data.saveIndex!]!,
                  onPress: (bool value) =>
                      settingsProvider.changeOption(data.saveIndex!, value),
                );
              }),
              buildDividerWithPadding(),
              Builder(builder: (_) {
                var data = settingsData.optionEditAccountInfo();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: false,
                  onPress: (bool value) => controller.launchUrlGoogleAccount(),
                  overrideSwitchButton: buildOptionEditAccountInfo(context),
                );
              }),
              buildDividerWithPadding(),
              Builder(builder: (_) {
                var data = settingsData.optionShareUserLocation();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: settingsProvider.options[data.saveIndex!]!,
                  onPress: (bool value) =>
                      settingsProvider.changeOption(data.saveIndex!, value),
                );
              }),
              Builder(builder: (_) {
                var data = settingsData.optionTravelNotice();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: settingsProvider.options[data.saveIndex!]!,
                  onPress: (bool value) =>
                      settingsProvider.changeOption(data.saveIndex!, value),
                );
              }),
              buildDividerWithPadding(),
              //
              const BuildGoogleListTitle(label: 'Advanced'),
              Builder(builder: (_) {
                var data = settingsData.optionAppSystemSettings();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: false,
                  onPress: (bool value) async => controller
                      .callPlatformSettings(context, SettingsEnum01.APP),
                  overrideSwitchButton: const SizedBox(),
                );
              }),
              Builder(builder: (_) {
                var data = settingsData.optionAppSystemNFCSettings();
                return BuildGoogleListSettingButton(
                  label: data.label,
                  description: data.description,
                  icon: data.icon,
                  switchValue: false,
                  onPress: (bool value) async => controller
                      .callPlatformSettings(context, SettingsEnum01.NFC),
                  overrideSwitchButton: const SizedBox(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // TODO: is this right? Duplicate for other options?
  Widget buildOptionEditAccountInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHalfPadding / 2),
      child: IconButton(
        icon: Icon(
          Icons.add_to_home_screen_rounded,
          size: kMediumIconSize * 1.2,
          color: Theme.of(context).primaryColorDark.withOpacity(0.65),
        ),
        onPressed: () => controller.launchUrlGoogleAccount(),
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
