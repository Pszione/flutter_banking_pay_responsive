import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';

class BorderDefaultPadding extends StatelessWidget {
  const BorderDefaultPadding({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: kDefaultPadding, right: kHalfPadding),
      child: child,
    );
  }
}

class BuildGoogleListButton extends StatelessWidget {
  const BuildGoogleListButton({
    Key? key,
    this.horizontalPadding = kDefaultPadding,
    required this.label,
    required this.icon,
    required this.onPress,
    this.alignment = MainAxisAlignment.start,
  }) : super(key: key);

  final double horizontalPadding;
  final String label;
  final IconData icon;
  final MainAxisAlignment alignment;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: InkWell(
        onTap: onPress,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: alignment,
            children: [
              SizedBox(
                  width: kDefaultRowSpacing,
                  child: Icon(icon, size: kSmallIconSize)),
              const SizedBox(width: 14),
              Semantics(
                button: true,
                child: SizedBox(
                  child: Text(
                    label,
                    style: AppTextStyles.kSmallBoldText(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildGoogleListSettingButton extends StatelessWidget {
  const BuildGoogleListSettingButton(
      {Key? key,
      this.horizontalPadding = kDefaultPadding,
      required this.label,
      this.description,
      required this.icon,
      required this.switchValue,
      required this.onPress,
      this.overrideSwitchButton})
      : super(key: key);

  final double horizontalPadding;
  final String? label;
  final String? description;
  final IconData? icon;
  final bool switchValue;
  final Function(bool) onPress;
  //final ValueChanged<bool> onPress;
  //final Function(int, bool) onHeyyy;
  final Widget? overrideSwitchButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 84,
      child: InkWell(
        onTap: () {
          // InkWell will act as switch
          //if (overrideSwitchButton == null)
          onPress.call(!switchValue);
        },
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: EdgeInsets.only(
              left: horizontalPadding, right: horizontalPadding / 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: kDefaultRowSpacing,
                  child: Icon(icon, size: kMediumIconSize)),
              const SizedBox(width: kHalfPadding), // 14
              Expanded(
                flex: 16,
                //width: 255,
                child: Semantics(
                  // is overriding
                  toggled: overrideSwitchButton != null ? null : switchValue,
                  button: overrideSwitchButton != null ? true : null,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        style: AppTextStyles.kSmallBoldText(),
                      ),
                      if (description != null)
                        AutoSizeText(
                          description!,
                          textAlign: TextAlign.justify,
                          wrapWords: false,
                          maxLines: 4,
                          maxFontSize: 12,
                          minFontSize: 6,
                          stepGranularity: 0.2,
                          style: AppTextStyles.kSmallText()
                              .copyWith(fontSize: null),
                        ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              if (overrideSwitchButton == null)
                ExcludeSemantics(
                  child: Switch.adaptive(
                    value: switchValue,
                    onChanged: onPress,
                    activeColor: kSecondaryColor,
                  ),
                ),
              // build another widget instead
              if (overrideSwitchButton != null)
                ExcludeSemantics(child: overrideSwitchButton!),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildGoogleListTitle extends StatelessWidget {
  const BuildGoogleListTitle({
    Key? key,
    this.horizontalPadding = kDefaultPadding,
    required this.label,
  }) : super(key: key);

  final double horizontalPadding;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: kHalfPadding / 1.5,
        left: horizontalPadding,
        right: horizontalPadding / 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: kSmallPadding / 1.2),
          Semantics(
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: AppTextStyles.kSmallBoldText(),
            ),
            header: true,
          ),
        ],
      ),
    );
  }
}
