import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../ui/ui.dart';

class AppSlidingBottomSheet {
  const AppSlidingBottomSheet({
    required this.context,
    required this.bodyWidget,
    this.initialSnap = 0.88,
    this.snappings = const [0.5, 0.88, 1.0],
    this.headerColor = kGrayColor,
  });
  final BuildContext context;
  final Widget? bodyWidget;

  final double? initialSnap;
  final List<double> snappings;
  final Color headerColor;

  Future<Widget?> showStyledSheet() => showSlidingBottomSheet(
        context,
        builder: (context) => SlidingSheetDialog(
          avoidStatusBar: true,
          duration: kDefaultDuration,
          cornerRadius: kDefaultBorderRadiusAsDouble,
          cornerRadiusOnFullscreen: 0.0,
          snapSpec: SnapSpec(
            initialSnap: initialSnap,
            snappings: snappings, // 50%
          ),
          headerBuilder: (_, state) => Material(
            child: Container(
              color: headerColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      margin:
                          const EdgeInsets.symmetric(vertical: kHalfPadding),
                      width: 32,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: kDefaultBorderRadius,
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ),
                ],
              ),
            ),
          ),
          builder: (_, state) => bodyWidget ?? const SizedBox(height: 0),
        ),
      );

  static Future<Widget?> demoSheet(BuildContext context) =>
      AppSlidingBottomSheet(
        context: context,
        snappings: [0.3, 0.5],
        headerColor: Theme.of(context).colorScheme.secondary,
        bodyWidget: Container(
          color: Theme.of(context).backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Theme.of(context).colorScheme.error,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 2),
                  ),
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Container(
                  height: 290,
                  color: Theme.of(context).backgroundColor,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        'Demo sliding sheet',
                        style: Theme.of(context).textTheme.headline5!,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Do you like it? Han?',
                        style: Theme.of(context).textTheme.subtitle1!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ).showStyledSheet();

  Future<Widget?> showAndroidStyledSheet() => showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
        clipBehavior: Clip.antiAlias,
        isDismissible: true,
        builder: (_) => bodyWidget ?? const SizedBox(height: 0),
      );
}
