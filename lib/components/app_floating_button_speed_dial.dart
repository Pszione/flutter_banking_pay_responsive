import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';

import '../constant_text_styles.dart';
import '../constants.dart';
import '../snackbar_errors.dart';

double _floatingElevation = 9;

class AppFloatingButtonSpeedDial extends StatelessWidget {
  const AppFloatingButtonSpeedDial({
    Key? key,
    required this.label,
    required this.icon,
    this.tooltip,
    this.openCloseState,
  }) : super(key: key);

  final String? label, tooltip;
  final IconData? icon;
  final ValueNotifier<bool>? openCloseState;

  @override
  Widget build(BuildContext context) {
    const Color dialIconsColor = kSecondaryColor;

    return SpeedDial(
      openCloseDial: openCloseState,
      foregroundColor: Theme.of(context).primaryColorDark,
      icon: icon, // animatedIcon: AnimatedIcons.menu_close,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColorDark,
        size: kMediumIconSize,
      ),
      buttonSize: kHugeIconSize * 1.6,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble)),
      label: label != null
          ? AutoSizeText(
              label!,
              style:
                  AppTextStyles.kFloatingButtonText().copyWith(fontSize: null),
              maxLines: 1,
              maxFontSize: 17,
              minFontSize: 12,
              stepGranularity: 0.5,
            )
          : null,
      tooltip: tooltip,
      elevation: _floatingElevation,
      animationSpeed: 400,
      spacing: 15, // initial child
      children: [
        SpeedDialChild(
          child: const Icon(Icons.send_rounded, color: dialIconsColor),
          label: S.of(context).homeScreen_first_fab_optionsDescription,
          elevation: _floatingElevation,
          onTap: () =>
              AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        ),
        SpeedDialChild(
          child: const Icon(Icons.arrow_circle_down_rounded,
              color: dialIconsColor),
          label: S.of(context).homeScreen_second_fab_optionsDescription,
          elevation: _floatingElevation,
          onTap: () =>
              AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        ),
        SpeedDialChild(
          child: const Icon(Icons.qr_code_rounded, color: dialIconsColor),
          label: S.of(context).homeScreen_third_fab_optionsDescription,
          elevation: _floatingElevation,
          onTap: () async => await ImagePicker().pickImage(
            source: ImageSource.camera,
          ),
        ),
        SpeedDialChild(
          child: const Icon(Icons.vpn_key_outlined, color: dialIconsColor),
          label: S.of(context).homeScreen_fourth_fab_optionsDescription,
          elevation: _floatingElevation,
          onTap: () =>
              AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        ),
      ],
    );
  }
}
