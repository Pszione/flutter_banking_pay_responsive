import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/core/android_quick_actions_shortcuts.dart';
import 'package:flutter_banking_pay_responsive/core/route_controller.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/main.dart';
import 'package:flutter_banking_pay_responsive/models/enums.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/cardScreen/card_screen.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/home_screen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_banking_pay_responsive/screens/setupScreen/setup_screen_controller.dart';
import 'package:get_it/get_it.dart';
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
  final SetupScreenController controller = GetIt.I<SetupScreenController>();

  ValueNotifier<int> getCurrentSelectedIndex = ValueNotifier(0);
  int get selectedIndex => getCurrentSelectedIndex.value;

  List<Widget> menuWidgets = <Widget>[
    // HomeScreen(), CardScreen(), ActivityInsightsScreen(),
    Consumer<HomeScreen>(builder: (_, screen, __) => screen),
    Consumer<CardScreen>(builder: (_, screen, __) => screen),
    Consumer<ActivityInsightsScreen>(builder: (_, screen, __) => screen),
  ];

  @override
  void initState() {
    super.initState();

    widget.keyValueScreen = ValueKey(this);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      MyApp.handleFullscreenSystemUIMode(context);
      Provider.of<NavigationBarShared>(context, listen: false).init(
          getCurrentIndex: getCurrentSelectedIndex,
          callbackOnPress: callbackOnBottomNavigationPress);
      // TODO
      Navigator.of(context).pushNamed(RouteController.routeHomeScreen);
      //
      BuildContext _context = widget.keyScreen.currentContext!;
      QuickActionsCustom().initializeDelayed(_context);
    });
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        bool willPop = popSelectedMenu();
        notifyPopDependencies(willPop);
        return Future.value(false);
      },
      child: Scaffold(
        key: widget.keyScreen,
        // body: Center(
        //   child: menuWidgets.elementAt(selectedIndex),
        // ),
        bottomNavigationBar:
            Provider.of<NavigationBarShared>(context, listen: false)
                .getNavigationBar,
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
      getCurrentSelectedIndex.value = index;
      HapticFeedback.selectionClick();
      notifyPopDependencies(true);

      print("Index: $selectedIndex");
    });
  }

  bool popSelectedMenu() {
    if (selectedIndex == 0) {
      return false;
    }
    if (selectedIndex < MenuState.values.length) {
      changeSelectedMenu(selectedIndex - 1);
    }
    return false; // or will exit app
  }

  void callbackOnBottomNavigationPress(int newIndex) {
    changeSelectedMenu(newIndex);
  }

  void notifyPopDependencies(bool willPop) {
    Provider.of<SetupScreenObservable>(context, listen: false)
        .notifyOnWillPop();
  }
}
