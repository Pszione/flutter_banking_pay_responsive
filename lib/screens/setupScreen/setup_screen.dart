import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/models/enums.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

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
        height: AppBar().preferredSize.height * 1.6,
        backgroundColor: Theme.of(context).colorScheme.background,
        labelTextStyle:
            //MaterialStateProperty.all(const TextStyle(fontSize: 14))
            MaterialStateProperty.resolveWith<TextStyle>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4);
            } else {
              return const TextStyle(fontSize: 14);
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
            }
          },
        ),
        indicatorColor: kSecondaryColor.withOpacity(0.8),
      ),
      child: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) => changeSelectedMenu(index),
        animationDuration: const Duration(seconds: 1, milliseconds: 100),
        destinations: const [
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.dollarSign),
            label: 'Pay',
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.solidCreditCard),
            label: 'Cards',
            selectedIcon: Icon(FontAwesomeIcons.creditCard),
          ),
          NavigationDestination(
            icon: Icon(FontAwesomeIcons.chartLine),
            label: 'Insights',
          ),
        ],
      ),
    );
  }

  BottomNavigationBar buildOldNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (int index) => changeSelectedMenu(index),
      selectedItemColor: Theme.of(context).colorScheme.primary,
      //selectedItemColor: kComplementaryColor,
      //unselectedItemColor: kTextGrayColor,
      iconSize: kMediumIconSize, // MenuState.pay == _selectedMenu ? 28 : 22,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dollarSign), label: 'Pay'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidCreditCard), label: 'Cards'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartLine), label: 'Insights'),
      ],
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
