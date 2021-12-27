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
              BuildGoogleListSettingButton(
                label: settingsData.optionEmailUpdates().label,
                description: settingsData.optionEmailUpdates().description,
                icon: settingsData.optionEmailUpdates().icon,
                switchValue: settingsProvider
                    .options[settingsData.optionEmailUpdates().saveIndex!]!,
                onPress: (bool value) => settingsProvider.changeOption(
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
                onPress: (bool value) => controller.launchUrlGoogleAccount(),
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
                onPress: (bool value) async => controller.callPlatformSettings(
                    context, SettingsEnum01.APP),
                overrideSwitchButton: const SizedBox(),
              ),
              BuildGoogleListSettingButton(
                label: settingsData.optionAppSystemNFCSettings().label,
                description:
                    settingsData.optionAppSystemNFCSettings().description,
                icon: settingsData.optionAppSystemNFCSettings().icon,
                switchValue: false,
                onPress: (bool value) async => controller.callPlatformSettings(
                    context, SettingsEnum01.NFC),
                overrideSwitchButton: const SizedBox(),
              ),
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
