import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constant_text_styles.dart';
import '../constants.dart';
import '../snackbar_errors.dart';

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
    return SpeedDial(
      openCloseDial: openCloseState,
      icon: icon,
      // animatedIcon: AnimatedIcons.menu_close,
      iconTheme: const IconThemeData(
        color: kDarkColor,
        size: kMediumIconSize,
      ),
      buttonSize: kHugeIconSize * 1.7,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble)),
      label: Text(
        label ?? '',
        style: AppTextStyles.kFloatingButtonText(),
      ),
      tooltip: tooltip,
      elevation: 8,
      animationSpeed: 400,
      spacing: 15, // initial child

      children: [
        SpeedDialChild(
          child: Icon(Icons.send_rounded),
          label: 'Send',
          elevation: 8,
          onTap: () =>
              AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.arrow_circle_down_rounded),
          label: 'Receive',
          elevation: 8,
          onTap: () =>
              AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.qr_code_rounded),
          label: 'QR code',
          elevation: 8,
          onTap: () =>
              AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.vpn_key_outlined),
          label: 'PIX',
          elevation: 8,
          onTap: () =>
              AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
        ),
      ],
    );
  }
}
