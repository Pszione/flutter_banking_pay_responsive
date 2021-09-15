import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/google_list_decorations.dart';

import '../../constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              label: 'Email updates',
              description: 'Get exclusive offers, tips, and invites',
              icon: Icons.email_outlined,
              onPress: () {},
            ),
            BuildGoogleListSettingButton(
              label: 'Purchase notifications',
              description: 'See transactions details after you make a purchase',
              icon: Icons.shopping_bag_outlined,
              onPress: () {},
            ),
            BuildGoogleListSettingButton(
              label: 'Updates about your tickets',
              description:
                  'Stay up-to-date on your events, flights, saved offers and more',
              icon: Icons.approval,
              onPress: () {},
            ),
            const SizedBox(height: kDefaultPadding),
            kDivider,
            const SizedBox(height: kDefaultPadding),
            BuildGoogleListSettingButton(
              label: 'Edit account info',
              description: 'Update your name, address, or other account info',
              icon: Icons.account_circle_sharp,
              onPress: () {},
            ),
            // homescreen
          ],
        ),
      ),
    );
  }
}
