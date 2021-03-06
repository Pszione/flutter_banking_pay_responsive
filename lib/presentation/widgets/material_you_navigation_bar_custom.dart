import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/core.dart';
import '../ui/ui.dart';

class MaterialYouNavigationBarCustom extends StatelessWidget {
  const MaterialYouNavigationBarCustom({
    Key? key,
    required this.getCurrentIndex,
    required this.callbackOnPress,
  }) : super(key: key);

  final ValueNotifier<int> getCurrentIndex;
  final void Function(int) callbackOnPress;

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      key: UniqueKey(),
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
      child: ValueListenableBuilder<int>(
        valueListenable: getCurrentIndex,
        builder: (_, index, __) {
          print("listenable: $index");
          return NavigationBar(
            selectedIndex: index,
            onDestinationSelected: callbackOnPress,
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
          );
        },
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
        child: ValueListenableBuilder<int>(
          valueListenable: getCurrentIndex,
          builder: (_, index, __) {
            return BottomNavigationBar(
              currentIndex: index,
              onTap: callbackOnPress,
              iconSize: kMediumIconSize,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.dollarSign),
                  label: 'Pay',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidCreditCard),
                  label: 'Cards',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.chartLine),
                  label: 'Insights',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
