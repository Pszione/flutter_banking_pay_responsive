import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';

class AppSnackBarErrors {
  static void showSnackBarFeatureUnavailable(BuildContext context) =>
      ScaffoldMessenger.of(context)
        ..hideCurrentMaterialBanner()
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(
              S.of(context).snackBar_featureUnavailableButBeingFixed_text,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              textAlign:
                  Responsive.isDesktop(context) ? TextAlign.center : null,
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
