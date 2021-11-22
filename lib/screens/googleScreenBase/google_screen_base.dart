import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';

class GoogleScreenBase extends StatefulWidget {
  const GoogleScreenBase({
    Key? key,
    this.showGoogleIcon = true,
    required this.child,
    this.appBar,
    this.title,
    this.description,
  }) : super(key: key);

  final bool showGoogleIcon;
  final String? title, description;
  final Widget child;
  final PreferredSizeWidget? appBar;

  static bool hasEnoughSpacing(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait ||
      Responsive.isDesktop(context);

  @override
  _GoogleScreenBaseState createState() => _GoogleScreenBaseState();
}

class _GoogleScreenBaseState extends State<GoogleScreenBase> {
  @override
  Widget build(BuildContext context) {
    final bool hasEnoughSpacing = GoogleScreenBase.hasEnoughSpacing(context);

    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: hasEnoughSpacing ? kHugePadding : kHalfPadding),
            children: [
              if (widget.showGoogleIcon && hasEnoughSpacing)
                Padding(
                  padding: EdgeInsets.only(
                      bottom:
                          hasEnoughSpacing ? kDefaultPadding : kHalfPadding),
                  child: Text(
                    K_GOOGLE_TEXT,
                    style: AppTextStyles.getBodyText(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (widget.title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: kSmallPadding),
                  child: Text(
                    widget.title!,
                    style: AppTextStyles.kMenuTitle(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (widget.description != null)
                Text(
                  widget.description!,
                  textAlign: TextAlign.center,
                ),
              // const Spacer(), // TODO
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}
