import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/core/android_quick_actions_shotcuts.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/main.dart';
import 'package:flutter_banking_pay_responsive/models/enums.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore_for_file: unused_local_variable, unused_field_variable
class SetupScreen extends StatefulWidget with ChangeNotifier {
  SetupScreen({Key? key}) : super(key: key);

  final keyScreen = GlobalKey<SetupScreenState>();
  late ValueKey<SetupScreenState> keyValueScreen;

  @override
  State<SetupScreen> createState() => SetupScreenState();
}

class SetupScreenState extends State<SetupScreen> {
  List<Widget> menuWidgets = <Widget>[
    // HomeScreen(), CardScreen(), ActivityInsightsScreen(),
    Consumer<HomeScreen>(builder: (_, screen, __) => screen),
    Consumer<CardScreen>(builder: (_, screen, __) => screen),
    Consumer<ActivityInsightsScreen>(builder: (_, screen, __) => screen),
  ];

  int _selectedIndex = 0;
  MenuState get selectedMenuState => MenuState.values[_selectedIndex];
  int get selectedIndex => _selectedIndex;
  Type get selectedWidgetType => menuWidgets[_selectedIndex].runtimeType;

  @override
  void initState() {
    super.initState();

    widget.keyValueScreen = ValueKey(this);

    // BuildContext _context = widget.keyScreen.currentContext!;
    // QuickActionsCustom().initializeDelayed(_context);
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MyApp.handleFullscreenSystemUIMode(context);
    final currentThemeMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light;

    return WillPopScope(
      onWillPop: () {
        notifyPopDependencies();
        print('Press: back button on ${widget.keyScreen}');
        return Future.value(popSelectedMenu());
      },
      child: Scaffold(
        key: widget.keyScreen,
        body: Center(
          child: menuWidgets.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: buildMaterialYouNavigationBar(context),
      ),
    );
  }

  Widget buildMaterialYouNavigationBar(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: kBottomNavigationHeight(context),
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
        indicatorColor: kSecondaryColor,
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
      height: kBottomNavigationHeight(context),
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

  void changeSelectedMenuByState(MenuState menu) {
    int index = MenuState.values.indexOf(menu);
    changeSelectedMenu(index);
  }

  void changeSelectedMenu(int index) {
    setState(() {
      if (index < 0 || index >= MenuState.values.length) {
        index = 0;
      }
      _selectedIndex = index;
      // this will work as Navigator.push route
      // because our Scaffold body will update its state
      // unfortunately wwe can not maintain widget state
      HapticFeedback.selectionClick();
      notifyPopDependencies();
    });
  }

  void notifyPopDependencies() {
    // HomeScreen
    Provider.of<HomeScreen>(context, listen: false)
        .keyValueScreen
        .value
        .openCloseStateFAB
        .value = false;
    // ActivityScreen
    Provider.of<DBSyncProvider>(context, listen: false)
        .clearClickedTransactionIndex();
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
