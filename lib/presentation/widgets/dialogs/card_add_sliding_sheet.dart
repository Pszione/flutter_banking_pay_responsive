import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../ui/ui.dart';

class CardAddSlidingSheet {
  Future<Widget?> showOptionsSlidingSheet(BuildContext context) {
    final _isScreenVertical =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return AppSlidingBottomSheet(
      context: context,
      snappings: _isScreenVertical ? [0.4] : [0.7],
      initialSnap: _isScreenVertical ? 0.4 : 0.7,
      headerColor: Theme.of(context).colorScheme.background,
      bodyWidget: Container(
        width: double.infinity,
        height: 250,
        color: Theme.of(context).colorScheme.background,
        child: Material(
          type: MaterialType.transparency,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kDefaultPadding),
              buildListButton(
                context,
                S.of(context).cardScreen_first_fab_optionsDescription,
                Icons.credit_card_outlined,
                () => _openScanScreen(context),
              ),
              buildListButton(
                context,
                S.of(context).cardScreen_second_fab_optionsDescription,
                Icons.style,
                () => _openScanScreen(context),
              ),
              buildListButton(
                context,
                S.of(context).cardScreen_third_fab_optionsDescription,
                Icons.stars_rounded,
                () => _openScanScreen(context),
              ),
              buildListButton(
                context,
                S.of(context).cardScreen_fourth_fab_optionsDescription,
                Icons.directions_bus_rounded,
                () => _openScanScreen(context),
              ),
            ],
          ),
        ),
      ),
    ).showStyledSheet();
  }

  void _openScanScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ROUTE_SCAN_CARD_SCREEN);
  }

  Widget buildListButton(
    BuildContext context,
    String? label,
    IconData? icon,
    void Function() onPress,
  ) {
    final TextStyle style =
        AppTextStyles.kFloatingButtonText().copyWith(fontSize: 20);
    const double buttonHeight = 45;

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      // TODO
      child: InkWell(
        onTap: onPress,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kDefaultRowSpacing,
                child: Icon(icon, size: kMediumIconSize),
              ),
              const SizedBox(width: 14),
              Text(label!, style: style)
            ],
          ),
        ),
      ),
    );
  }
}
