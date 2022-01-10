// import 'package:flutter/material.dart';
//
// import '../ui/ui.dart';
//
// class AppAlertDialog {
//   const AppAlertDialog({
//     Key? key,
//     required this.title,
//     required this.contentText,
//     this.backgroundColor,
//     this.buttonColor,
//   });
//
//   final String? title, contentText;
//   final Color? backgroundColor, buttonColor;
//
//   Future<String?> showAlertDialogDismissible(BuildContext context) {
//     return showDialog<String>(
//       context: context,
//       barrierDismissible: true, // click outside to dismiss
//       useSafeArea: true,
//       barrierColor: Colors.black.withOpacity(kAlertOverlayOpacity),
//       builder: (BuildContext context) => AlertDialog(
//         title: Text(title ?? 'Alert'),
//         elevation: 20,
//         shape: RoundedRectangleBorder(
//           borderRadius: kHugeBorderRadius,
//         ),
//         titleTextStyle: AppTextStyles.kMenuTitle(context),
//         backgroundColor: backgroundColor,
//         content: SingleChildScrollView(
//           child: Text(contentText ??
//               "Feature unavailable at the moment. We'll fix it right away!"),
//         ),
//         actions: <Widget>[
//           // TextButton(
//           //   onPressed: () => Navigator.pop(context, 'Cancel'),
//           //   child: const Text('Cancel'),
//           // ),
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'OK'), // Dismiss
//             child: Text(
//               'OK',
//               style: AppTextStyles.kMenuTitle(context).copyWith(
//                   color: buttonColor ?? Theme.of(context).colorScheme.primary),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<String?> showAlertDialog(
//       BuildContext context, String? buttonTitle, GestureTapCallback onPressed) {
//     return showDialog<String>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         title: Text(title ?? 'Alert'),
//         shape: RoundedRectangleBorder(borderRadius: kHugeBorderRadius),
//         titleTextStyle: AppTextStyles.kMenuTitle(context),
//         backgroundColor:
//             backgroundColor ?? Theme.of(context).colorScheme.secondary,
//         elevation: 20,
//         content: Text(contentText ?? ''),
//         actions: <Widget>[
//           // TextButton(
//           //   onPressed: () => Navigator.pop(context, 'Cancel'),
//           //   child: const Text('Cancel'),
//           // ),
//           TextButton(
//             onPressed: onPressed, // Dismiss
//             child: Text(
//               buttonTitle ?? 'OK',
//               style: AppTextStyles.kMenuTitle(context).copyWith(
//                   color: buttonColor ?? Theme.of(context).colorScheme.primary),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
