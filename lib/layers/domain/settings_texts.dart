import 'package:flutter/material.dart';
// TODO: remove this dependency
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';

class SettingsOptionText {
  SettingsOptionText(
      {required this.label,
      this.description,
      this.icon,
      required this.saveIndex});

  String? label, description;
  IconData? icon;
  int? saveIndex; // at SettingsProvider
}

class SettingsTexts {
  SettingsTexts({required this.l10nInstance});
  final S? l10nInstance;

  SettingsOptionText optionEmailUpdates() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionEmailUpdates ?? 'Email updates',
      description:
          l10nInstance?.settingsScreen_optionEmailUpdates_description ?? '',
      icon: Icons.email_outlined,
      saveIndex: 0);

  SettingsOptionText optionPurchaseNotifications() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionPurchaseNotifications ??
          'Purchase notifications',
      description: l10nInstance
              ?.settingsScreen_optionPurchaseNotifications_description ??
          '',
      icon: Icons.shopping_bag_outlined,
      saveIndex: 1);

  SettingsOptionText optionTicketsUpdates() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionTicketsUpdates ??
          'Updates about your tickets',
      description:
          l10nInstance?.settingsScreen_optionTicketsUpdates_description ?? '',
      icon: Icons.approval,
      saveIndex: 2);

  SettingsOptionText optionEditAccountInfo() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionEditAccountInfo ??
          'Edit account info',
      description:
          l10nInstance?.settingsScreen_optionEditAccountInfo_description ?? '',
      icon: Icons.account_circle_sharp,
      saveIndex: 3);

  SettingsOptionText optionShareUserLocation() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionShareUserLocation ??
          'Share your location',
      description:
          l10nInstance?.settingsScreen_optionShareUserLocation_description ??
              '',
      icon: Icons.not_listed_location_outlined,
      saveIndex: 4);

  SettingsOptionText optionTravelNotice() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionTravelNotice ??
          'Are you travelling?',
      description:
          l10nInstance?.settingsScreen_optionTravelNotice_description ?? '',
      icon: Icons.airplanemode_on_rounded,
      saveIndex: 5);

  SettingsOptionText optionAppSystemSettings() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionAppSystemSettings ??
          '(System) App settings',
      description:
          l10nInstance?.settingsScreen_optionAppSystemSettings_description,
      icon: Icons.add_box_outlined,
      saveIndex: 6);

  SettingsOptionText optionAppSystemNFCSettings() => SettingsOptionText(
      label: l10nInstance?.settingsScreen_optionAppSystemNFCSettings ??
          '(System) Contactless/NFC',
      description:
          l10nInstance?.settingsScreen_optionAppSystemNFCSettings_description ??
              '',
      icon: Icons.add_box_outlined,
      saveIndex: 7);
}
