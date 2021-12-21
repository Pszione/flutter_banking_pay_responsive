import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/material_you_navigation_bar_custom.dart';
import 'package:flutter_banking_pay_responsive/core/android_quick_actions_shotcuts.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/main.dart';
import 'package:flutter_banking_pay_responsive/models/enums.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
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

  late final MaterialYouNavigationBarCustom navBar =
      MaterialYouNavigationBarCustom(
    getCurrentIndex: getValueCurrentIndex,
    callbackOnPress: callbackOnBottomNavigationPress,
  );

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
        bottomNavigationBar: navBar,
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

  void callbackOnBottomNavigationPress(int index) {
    // _selectedIndex
    print('clicked! with $index');
    changeSelectedMenu(index);
  }

  int getValueCurrentIndex() => _selectedIndex;

  void notifyPopDependencies() {
    // TODO: create observer pattern
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
