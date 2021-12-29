import 'package:flutter_banking_pay_responsive/layers/data/enums.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/homeScreen/home_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/setupScreen/setup_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SetupScreen should', () {
    //
    test('have 2 or more than 2 menu states', () {
      var states = MenuState.values;

      expect(states.length, anyOf([2, 3, 4, 5, 6, 7, 8, 9, 10]));
    });
    test('have menu widgets for each given menu state', () {
      var states = MenuState.values;
      // var widgets = SetupScreenState.menuWidgets;

      // expect(widgets, anything);
      // expect(states.length, widgets.length);
    });
    test('[HomeScreen] be the first menu widget', () {
      // var widgets = SetupScreenState.menuWidgets;
      // var stateful = SetupScreen().keySetupScreen.currentState;

      // expect(widgets, anything);
      // expect(widgets[0].runtimeType, HomeScreen().runtimeType);
      // expect(stateful?.selectedWidgetType, const HomeScreen().runtimeType);
    });
    // test('changeSelectedMenu method change selected index', () {
    //   var stateful = SetupScreen().keySetupScreen.currentState;
    //
    //   int newIndex = 2;
    //   // ACT
    //   expect(stateful?.selectedIndex, 0);
    //   stateful?.changeSelectedMenu(newIndex);
    //   expect(stateful?.selectedIndex, newIndex);
    // });
  });
}
