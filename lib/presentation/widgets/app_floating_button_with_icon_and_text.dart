import 'package:flutter/material.dart';

import '../ui/ui.dart';

class AppFloatingButtonIconAndText extends StatelessWidget {
  const AppFloatingButtonIconAndText({
    Key? key,
    required this.label,
    required this.icon,
    this.tooltip,
    required this.onPressed,
  }) : super(key: key);

  final String? label, tooltip;
  final IconData? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      tooltip: tooltip,
      foregroundColor: Theme.of(context).primaryColorDark,
      icon: Icon(icon, size: kHugeIconSize),
      isExtended: label != null,
      label: Text(
        label ?? '',
        style: AppTextStyles.kFloatingButtonText(),
        maxLines: 1,
      ),
    );
  }
}
