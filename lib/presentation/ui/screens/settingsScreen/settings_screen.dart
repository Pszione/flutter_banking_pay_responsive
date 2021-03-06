import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../layers/layers.dart';
import '../../ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, required this.controller}) : super(key: key);

  final SettingsScreenController controller;

  @override
  Widget build(BuildContext context) {
    changeWebAppTabName(
        label: S.of(context).googleAccountDialog_settings_button_title);
    handleSystemUIColor(context, null);
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
              Builder(
                builder: (_) {
                  var data = settingsData.optionEmailUpdates();
                  return BuildGoogleListSettingButton(
                    label: data.label,
                    description: data.description,
                    icon: data.icon,
                    switchValue: settingsProvider.options[data.saveIndex!]!,
                    onPress: (bool value) =>
                        settingsProvider.changeOption(data.saveIndex!, value),
                  );
                },
              ),
              Builder(
                builder: (_) {
                  var data = settingsData.optionPurchaseNotifications();
                  return BuildGoogleListSettingButton(
                    label: data.label,
                    description: data.description,
                    icon: data.icon,
                    switchValue: settingsProvider.options[data.saveIndex!]!,
                    onPress: (bool value) =>
                        settingsProvider.changeOption(data.saveIndex!, value),
                  );
                },
              ),
              Builder(
                builder: (_) {
                  var data = settingsData.optionTicketsUpdates();
                  return BuildGoogleListSettingButton(
                    label: data.label,
                    description: data.description,
                    icon: data.icon,
                    switchValue: settingsProvider.options[data.saveIndex!]!,
                    onPress: (bool value) =>
                        settingsProvider.changeOption(data.saveIndex!, value),
                  );
                },
              ),
              buildDividerWithPadding(),
              Builder(
                builder: (_) {
                  var data = settingsData.optionEditAccountInfo();
                  return BuildGoogleListSettingButton(
                    label: data.label,
                    description: data.description,
                    icon: data.icon,
                    switchValue: false,
                    onPress: (bool value) =>
                        controller.launchUrlGoogleAccount(),
                    overrideSwitchButton: buildOptionEditAccountInfo(context),
                  );
                },
              ),
              buildDividerWithPadding(),
              Builder(
                builder: (_) {
                  var data = settingsData.optionShareUserLocation();
                  return BuildGoogleListSettingButton(
                    label: data.label,
                    description: data.description,
                    icon: data.icon,
                    switchValue: settingsProvider.options[data.saveIndex!]!,
                    onPress: (bool value) =>
                        settingsProvider.changeOption(data.saveIndex!, value),
                  );
                },
              ),
              Builder(
                builder: (_) {
                  var data = settingsData.optionTravelNotice();
                  return BuildGoogleListSettingButton(
                    label: data.label,
                    description: data.description,
                    icon: data.icon,
                    switchValue: settingsProvider.options[data.saveIndex!]!,
                    onPress: (bool value) =>
                        settingsProvider.changeOption(data.saveIndex!, value),
                  );
                },
              ),
              buildDividerWithPadding(),
              //
              const BuildGoogleListTitle(label: 'Advanced'),
              Builder(
                builder: (_) {
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
                },
              ),
              Builder(
                builder: (_) {
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
                },
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
      padding: const EdgeInsets.symmetric(horizontal: kVerySmallPadding),
      child: IconButton(
        icon: const Opacity(
          opacity: 0.65,
          child: Icon(
            Icons.add_to_home_screen_rounded,
            size: kMediumIconSize * 1.2,
          ),
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
