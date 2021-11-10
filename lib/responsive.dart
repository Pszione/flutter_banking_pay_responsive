import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    Key? key,
    required this.mobile,
    this.mobileLarge,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  static const kMaxTabletWidth = 768.0;
  static const kMaxDesktopWidth = 1440.0;
  static const kMaxDesktopReadingModeWidth = 1180.0;
  static const kSideMenuWidth = 300.0;
  static const kNavigationRailWidth = 72.0;

  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget? desktop;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1024 &&
      MediaQuery.of(context).size.width >= 500;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 1024 && desktop != null) {
      return desktop!;
    } else if (_size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (_size.width >= 500 && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }

  Widget LayoutConstrained(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < kMaxTabletWidth) {
          return mobile;
        } else if (constraints.maxWidth >= kMaxTabletWidth &&
            constraints.maxWidth <= kMaxDesktopWidth) {
          return tablet ?? mobile;
        } else {
          return desktop ?? mobile;
        }
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final Size _size = MediaQuery.of(context).size;
  //
  //   if (_size.width >= 1024 && desktop != null) {
  //     return desktop!;
  //   } else if (_size.width >= 700 && tablet != null) {
  //     return tablet!;
  //   } else if (_size.width >= 500 && mobileLarge != null) {
  //     return mobileLarge!;
  //   } else {
  //     return mobile;
  //   }
  // }
}

class ResponsiveWidthConstrained extends StatelessWidget {
  const ResponsiveWidthConstrained({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  // final bool isContentCentered;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: Responsive.kMaxDesktopReadingModeWidth),
        child: child,
      ),
    );
  }
}
