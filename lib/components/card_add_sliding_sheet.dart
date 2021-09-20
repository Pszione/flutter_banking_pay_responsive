import 'package:flutter/material.dart';

import '../constant_text_styles.dart';
import '../constants.dart';
import 'app_sliding_bottom_sheet.dart';

class CardAddSlidingSheet {
  Future<Widget> showOptionsSlidingSheet(BuildContext context) async {
    return await AppSlidingBottomSheet(
      context: context,
      snappings: [0.4],
      initialSnap: 0.4,
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
              buildListButton(context, 'Debit or credit card',
                  Icons.credit_card_outlined, () {}),
              buildListButton(context, 'Gift card', Icons.style, () {}),
              buildListButton(context, 'Loyalty', Icons.stars_rounded, () {}),
              buildListButton(
                  context, 'Transit', Icons.directions_bus_rounded, () {}),
            ],
          ),
        ),
      ),
    ).showStyledSheet();
  }

  SizedBox buildListButton(BuildContext context, String? label, IconData? icon,
      GestureTapCallback onPress) {
    final TextStyle style =
        AppTextStyles.kFloatingButtonText().copyWith(fontSize: 20);
    const double buttonHeight = 45;

    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: InkWell(
        onTap: onPress,
        splashColor: Theme.of(context).colorScheme.secondary,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: kDefaultRowSpacing,
                  child: Icon(icon, size: kMediumIconSize)),
              const SizedBox(width: 14),
              Text(label!, style: style)
            ],
          ),
        ),
      ),
    );
  }
}

class BorderDefaultPadding extends StatelessWidget {
  const BorderDefaultPadding({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
      child: child,
    );
  }
}
