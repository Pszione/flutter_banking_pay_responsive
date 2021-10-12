import 'package:flutter/material.dart';

class AppSnackBarErrors {
  static void showSnackBarFeatureUnavailable(BuildContext context) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner()
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: const Text(
              "Feature unavailable at the moment. We'll fix it right away!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            dismissDirection: DismissDirection.down,
            // contentTextStyle:
            //     const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );

  static void showSnackBar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner()
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(
              text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            dismissDirection: DismissDirection.down,
            // contentTextStyle:
            //     const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
}
