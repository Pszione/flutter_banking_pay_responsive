import 'package:flutter/material.dart';

class SettingsOptionText {
  SettingsOptionText(
      {required this.label, this.description, this.icon, this.saveIndex});

  String? label, description;
  IconData? icon;
  int? saveIndex; // at SettingsProvider
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
      description: 'Update your name, address, and any other account info',
      icon: Icons.account_circle_sharp,
      saveIndex: 3);

  static SettingsOptionText optionShareUserLocation() => SettingsOptionText(
      label: 'Share your location',
      description:
          'For your safety and fraud investigations. Baking Pay would like to access your location when you do a purchase',
      icon: Icons.not_listed_location_outlined,
      saveIndex: 4);

  static SettingsOptionText optionTravelNotice() => SettingsOptionText(
      label: 'Are you travelling?',
      description:
          'Enjoy your trip! But first let us know so that all your purchases goes pass our security monitoring',
      icon: Icons.airplanemode_on_rounded,
      saveIndex: 5);

  static SettingsOptionText optionAppSystemSettings() => SettingsOptionText(
      label: '(System) App settings',
      description: "Options to change app's permission, notifications and more",
      icon: Icons.add_box_outlined,
      saveIndex: 6);

  static SettingsOptionText optionAppSystemNFCSettings() => SettingsOptionText(
      label: '(System) Contactless/NFC',
      description:
          "Options to setup phone's NFC, your contactless payment uses it ",
      icon: Icons.add_box_outlined,
      saveIndex: 7);
}
