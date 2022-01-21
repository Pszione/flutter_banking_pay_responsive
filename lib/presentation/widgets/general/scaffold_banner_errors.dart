import 'package:flutter/material.dart';

import '../../ui/ui.dart';

class AppScaffoldBannerErrors {
  static void showBannerUnavailable(BuildContext context) =>
      ScaffoldMessenger.of(context)
        ..removeCurrentMaterialBanner() // force show new banner
        ..showMaterialBanner(
          MaterialBanner(
            padding: const EdgeInsets.only(top: kHugePadding),
            backgroundColor: Theme.of(context).colorScheme.error,
            content: const Text(
              "Feature unavailable at the moment. We'll fix it right away!",
            ),
            contentTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            actions: [
              TextButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                child: Text(
                  'Dismiss'.toUpperCase(),
                ),
              ),
            ],
          ),
        );
}
