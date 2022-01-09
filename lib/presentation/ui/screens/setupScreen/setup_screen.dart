import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../../layers/layers.dart';
import '../../ui.dart';

class SetupScreen extends StatefulWidget with ChangeNotifier {
  SetupScreen({Key? key}) : super(key: key);

  final GlobalKey<SetupScreenState> keyScreen = GlobalKey<SetupScreenState>();
  late ValueKey<SetupScreenState> keyValueScreen;

  @override
  State<SetupScreen> createState() => SetupScreenState();
}

class SetupScreenState extends State<SetupScreen> {
  final SetupScreenController controller = G<SetupScreenController>();

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
      handleFullscreenSystemUIMode(context);
      Provider.of<NavigationBarShared>(context, listen: false).init(
          getCurrentIndex: getCurrentSelectedIndex,
          callbackOnPress: callbackOnBottomNavigationPress);
      // TODO
      Navigator.of(context).pushNamed(ROUTE_HOME_SCREEN);
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
    if (index == 0) {
      getCurrentSelectedIndex.value = index;
      // Navigator.of(context).maybePop();
      Navigator.of(context).popUntil(ModalRoute.withName(ROUTE_HOME_SCREEN));
    } else if (index == 1) {
      getCurrentSelectedIndex.value = index;
      Navigator.of(context).pushNamed(ROUTE_CARD_SCREEN);
    } else if (index == 2) {
      getCurrentSelectedIndex.value = index;
      Navigator.of(context).pushNamed(ROUTE_ACTIVITY_INSIGHTS_SCREEN);
    }
    HapticFeedback.selectionClick();
    notifyPopDependencies(true);
    print("New Index: $selectedIndex");
  }

  bool popSelectedMenu() {
    if (selectedIndex == 0) {
      return false;
    }
    if (selectedIndex < MenuState.values.length) {
      changeSelectedMenu(selectedIndex - 1);
      return true;
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
