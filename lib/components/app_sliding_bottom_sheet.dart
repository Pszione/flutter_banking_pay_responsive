import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../constants.dart';

class AppSlidingBottomSheet {
  const AppSlidingBottomSheet({
    required this.context,
    required this.bodyWidget,
    this.initialSnap = 0.88,
    this.snappings = const [0.5, 0.88],
    this.headerColor = kGrayColor,
  });
  final BuildContext context;
  final Widget bodyWidget;

  final double? initialSnap;
  final List<double> snappings;
  final Color headerColor;

  Future<Widget> showStyledSheet() async => await showSlidingBottomSheet(
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
          headerBuilder: (context, state) => Material(
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
                          color: kWhiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          builder: (context, state) => bodyWidget,
        ),
      );
}
