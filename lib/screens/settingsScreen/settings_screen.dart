import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/google_list_decorations.dart';
import 'package:flutter_banking_pay_responsive/models/settings_texts.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../data_providers.dart';

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
                  .options[SettingsTexts.optionEmailUpdates().saveIndex!],
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
                  SettingsTexts.optionPurchaseNotifications().saveIndex!],
              onPress: (bool value) => settingsProvider.invertOptionValue(
                SettingsTexts.optionPurchaseNotifications().saveIndex!,
              ),
            ),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionTicketsUpdates().label,
              description: SettingsTexts.optionTicketsUpdates().description,
              icon: SettingsTexts.optionTicketsUpdates().icon,
              switchValue: settingsProvider
                  .options[SettingsTexts.optionTicketsUpdates().saveIndex!],
              onPress: (bool value) => settingsProvider.invertOptionValue(
                SettingsTexts.optionTicketsUpdates().saveIndex!,
              ),
            ),
            const SizedBox(height: kDefaultPadding),
            kDivider,
            const SizedBox(height: kDefaultPadding),
            BuildGoogleListSettingButton(
              label: SettingsTexts.optionEditAccountInfo().label,
              description: SettingsTexts.optionEditAccountInfo().description,
              icon: SettingsTexts.optionEditAccountInfo().icon,
              switchValue: settingsProvider
                  .options[SettingsTexts.optionEditAccountInfo().saveIndex!],
              onPress: (bool value) => settingsProvider.invertOptionValue(
                SettingsTexts.optionEditAccountInfo().saveIndex!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
