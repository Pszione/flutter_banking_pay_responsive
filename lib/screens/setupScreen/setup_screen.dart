import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/models/enums.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import '../../size_config.dart';

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
    return Scaffold(
      body: Center(
        child: _menuOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kComplementaryColor,
        unselectedItemColor: kTextGrayColor,
        iconSize: kMediumIconSize, // MenuState.pay == _selectedMenu ? 28 : 22,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.dollarSign), label: 'Pay'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidCreditCard), label: 'Cards'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.chartLine), label: 'Insights'),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() {
          _selectedIndex = index;
          _selectedMenu = MenuState.values[index];
          // this will work as Navigator.push route
          // because our Scaffold body will update its state
        }),
      ),
    );
  }
}
