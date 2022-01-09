import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../ui/ui.dart';

class ShimmerProgressIndicator extends StatelessWidget {
  const ShimmerProgressIndicator({
    Key? key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  }) : super(key: key);

  final Widget child;
  final Color? baseColor, highlightColor;

  // final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
  static isDarkMode(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark
          ? true // ThemeMode.dark
          : false; // ThemeMode.light;

  static themeDependentBaseColor(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark
          ? kDarkShimmerColor
          : kLightShimmerColor;

  @override
  Widget build(BuildContext context) {
    if (baseColor != null && highlightColor != null) {
      return Shimmer.fromColors(
        baseColor: baseColor!,
        highlightColor: highlightColor!,
        child: child,
      );
    }
    return Shimmer.fromColors(
      baseColor: themeDependentBaseColor(context),
      highlightColor: Theme.of(context).scaffoldBackgroundColor,
      child: child,
    );
  }
}
