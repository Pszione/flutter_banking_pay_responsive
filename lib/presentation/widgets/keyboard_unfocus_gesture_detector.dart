import 'package:flutter/material.dart';

class KeyboardUnfocusGestureDetector extends StatelessWidget {
  const KeyboardUnfocusGestureDetector(
      {Key? key, required this.child, this.onPressExtraBehaviour})
      : super(key: key);

  final Widget child;
  final void Function()? onPressExtraBehaviour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onPressExtraBehaviour?.call();
      },
      behavior: HitTestBehavior.translucent,
      excludeFromSemantics: true,
      child: child,
    );
  }
}
