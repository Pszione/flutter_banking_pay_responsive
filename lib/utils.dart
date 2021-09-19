import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      FocusManager.instance.primaryFocus?.unfocus(); // new
    }
  }
}

class Https {
  static void launchURL({required String url, bool forceWebView = true}) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: forceWebView,
        forceSafariVC: true, // to open URL in default browser of the phone
        enableJavaScript: true,
        //webOnlyWindowName: 'WebView Testing',
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
