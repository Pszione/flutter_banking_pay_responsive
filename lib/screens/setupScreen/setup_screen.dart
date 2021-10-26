import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/models/enums.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

// ignore_for_file: unused_local_variable, unused_field_variable
class SetupScreen extends StatefulWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  static const List<Widget> _menuOptions = <Widget>[
    HomeScreen(),
    CardScreen(),
    ActivityInsightsScreen(),
  ];

  //late SizeConfig _sizes;
  int _selectedIndex = 0;
  MenuState _selectedMenu = MenuState.pay;

  @override
  Widget build(BuildContext context) {
    final currentThemeMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light;

    return WillPopScope(
      onWillPop: () {
        //return Future.value(false);
        return Future.value(popSelectedMenu());
      },
      child: Scaffold(
        body: Center(
          child: _menuOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: buildMaterialYouNavigationBar(context),
      ),
    );
  }

  Widget buildMaterialYouNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: kBottomNavigationHeight,
        backgroundColor: Theme.of(context).colorScheme.background,
        labelTextStyle:
            //MaterialStateProperty.all(const TextStyle(fontSize: 14))
            MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return AppTextStyles.kNavigationBarSelectedText;
            } else {
              return AppTextStyles.kNavigationBarText;
              // return null; // Use the component's default.
            }
          },
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(size: kSmallIconSize * 1.3);
            } else {
              return const IconThemeData(size: kSmallIconSize);
              // return null; // Use the component's default.
            }
          },
        ),
        indicatorColor: kSecondaryColor.withOpacity(0.8),
      ),
      child: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) => changeSelectedMenu(index),
        animationDuration: const Duration(seconds: 1, milliseconds: 700),
        destinations: [
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.dollarSign),
            label: S.of(context).navigationBar_first_title,
          ),
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.solidCreditCard),
            label: S.of(context).navigationBar_second_title,
            selectedIcon: const Icon(FontAwesomeIcons.creditCard),
          ),
          NavigationDestination(
            icon: const Icon(FontAwesomeIcons.chartLine),
            label: S.of(context).navigationBar_third_title,
          ),
        ],
      ),
    );
  }

  Widget buildOldNavigationBar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: kBottomNavigationHeight,
      child: BottomNavigationBarTheme(
        data: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          selectedLabelStyle: AppTextStyles.kNavigationBarSelectedText,
          enableFeedback: true,
          elevation: 0,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) => changeSelectedMenu(index),
          iconSize:
              kMediumIconSize, // MenuState.pay == _selectedMenu ? 28 : 22,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.dollarSign), label: 'Pay'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidCreditCard), label: 'Cards'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.chartLine), label: 'Insights'),
          ],
        ),
      ),
    );
  }

  void changeSelectedMenu(int index) {
    setState(() {
      if (index < 0 || index >= MenuState.values.length) {
        index = 0;
      }
      _selectedIndex = index;
      _selectedMenu = MenuState.values[index];
      // this will work as Navigator.push route
      // because our Scaffold body will update its state
      // unfortunately wwe can not maintain widget state
      HapticFeedback.selectionClick();
    });
  }

  bool popSelectedMenu() {
    if (_selectedIndex == 0) {
      return false;
    }
    if (_selectedIndex < MenuState.values.length) {
      changeSelectedMenu(_selectedIndex - 1);
    }
    return false; // or will exit app
  }

  void popNavigationWithResult(/*BuildContext context, */ bool success) {
    Navigator.pop(context, success); // return value
  }

  void popNavigationWithResults(/*BuildContext context, */ dynamic results) {
    //popNavigationWithResults(context, 'from_back_button');
    Navigator.pop(context, results); // return value
  }
}
