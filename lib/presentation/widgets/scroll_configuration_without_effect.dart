import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

/// The glow effect from GlowingOverscrollIndicator added by ScrollBehavior
/// To remove this effect, simply wrap any given part of your application into
/// a ScrollConfiguration with the desired ScrollBehavior
class ScrollConfigurationWithoutEffect extends StatelessWidget {
  const ScrollConfigurationWithoutEffect({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollWithoutGlowEffect(),
      child: child,
    );
  }
}

class ScrollWithoutGlowEffect extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ScrollBehaviorGesturesCustom extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
