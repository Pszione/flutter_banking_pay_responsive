import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/material_you_navigation_bar_custom.dart';
import 'package:flutter_banking_pay_responsive/core/android_quick_actions_shortcuts.dart';
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

  late MaterialYouNavigationBarCustom navBar = MaterialYouNavigationBarCustom(
    getCurrentIndex: getValueSelectedIndex,
    callbackOnPress: callbackOnBottomNavigationPress,
  );

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  MenuState get selectedMenuState => MenuState.values[_selectedIndex];
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

  /// this will work as Navigator.push route
  void changeSelectedMenuByState(MenuState menu) {
    int index = MenuState.values.indexOf(menu);
    changeSelectedMenu(index);
  }

  /// this will work as Navigator.push route
  void changeSelectedMenu(int index) {
    setState(() {
      if (index < 0 || index >= MenuState.values.length) {
        index = 0;
      }
      _selectedIndex = index;
      HapticFeedback.selectionClick();
      notifyPopDependencies();
    });
  }

  int getValueSelectedIndex() => _selectedIndex;

  void callbackOnBottomNavigationPress(int index) {
    // _selectedIndex
    print('clicked! with $index');
    changeSelectedMenu(index);
  }

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
}
