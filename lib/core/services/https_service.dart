import 'package:url_launcher/url_launcher.dart';

class HttpsService {
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
