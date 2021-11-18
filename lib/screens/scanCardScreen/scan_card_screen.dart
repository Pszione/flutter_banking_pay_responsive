import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/screens/googleScreenBase/google_screen_base.dart';
import 'package:flutter_banking_pay_responsive/snackbar_errors.dart';
import 'package:image_picker/image_picker.dart';

class ScanCardScreen extends StatefulWidget {
  const ScanCardScreen({Key? key}) : super(key: key);

  @override
  _ScanCardScreenState createState() => _ScanCardScreenState();
}

class _ScanCardScreenState extends State<ScanCardScreen> {
  @override
  Widget build(BuildContext context) {
    return GoogleScreenBase(
      title: S.of(context).scanCardScreen_tabBarTitle,
      description: S.of(context).scanCardScreen_tabBarDescription,
      child: buildScanCard(),
    );
  }

  Widget buildScanCard() {
    final bool hasEnoughSpacing = GoogleScreenBase.hasEnoughSpacing(context);

    return SizedBox(
      height: hasEnoughSpacing ? 500 : 400,
      child: Column(
        children: [
          SizedBox(height: hasEnoughSpacing ? kHugePadding : 0),
          CardOutlineWidget(
            width: 280,
            height: 150,
            backgroundColor: Theme.of(context).primaryColor,
            label: S.of(context).scanCardScreen_clickToScan_title,
            onPress: () async => await ImagePicker().pickVideo(
              source: ImageSource.camera,
              maxDuration: const Duration(seconds: 1),
            ),
          ),
          SizedBox(height: hasEnoughSpacing ? kDefaultPadding : kSmallPadding),
          Text(S.of(context).scanCardScreen_or_text),
          TextButton(
              onPressed: () =>
                  AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
              child: AutoSizeText(
                S.of(context).scanCardScreen_enterCardManually_title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, letterSpacing: 0.4),
                maxFontSize: 14,
              )),
          if (hasEnoughSpacing) const Spacer(flex: 4),
          if (!hasEnoughSpacing) const SizedBox(height: kDefaultPadding),
          AutoSizeText(
            S.of(context).scanCardScreen_makeSureCardHolderNameAnd_bottomNote,
            textAlign: TextAlign.center,
            maxFontSize: 13,
            minFontSize: 10,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
