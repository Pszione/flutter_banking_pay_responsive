import 'package:flutter/material.dart';

class SettingsOptionText {
  SettingsOptionText(
      {required this.label, this.description, this.icon, this.saveIndex});

  String? label, description;
  IconData? icon;
  int? saveIndex;
}

class SettingsTexts {
  static SettingsOptionText optionEmailUpdates() => SettingsOptionText(
      label: 'Email updates',
      description: 'Get exclusive offers, tips, and invites',
      icon: Icons.email_outlined,
      saveIndex: 0);

  static SettingsOptionText optionPurchaseNotifications() => SettingsOptionText(
      label: 'Purchase notifications',
      description: 'See transactions details after you make a purchase',
      icon: Icons.shopping_bag_outlined,
      saveIndex: 1);

  static SettingsOptionText optionTicketsUpdates() => SettingsOptionText(
      label: 'Updates about your tickets',
      description:
          'Stay up-to-date on your events, flights, saved offers and more',
      icon: Icons.approval,
      saveIndex: 2);

  static SettingsOptionText optionEditAccountInfo() => SettingsOptionText(
      label: 'Edit account info',
      description: 'Update your name, address, or other account info',
      icon: Icons.account_circle_sharp,
      saveIndex: 3);
}
