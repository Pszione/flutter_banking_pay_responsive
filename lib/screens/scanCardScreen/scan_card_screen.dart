import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant_text_styles.dart';
import '../../snackbar_errors.dart';

class ScanCardScreen extends StatefulWidget {
  const ScanCardScreen({Key? key}) : super(key: key);

  @override
  _ScanCardScreenState createState() => _ScanCardScreenState();
}

class _ScanCardScreenState extends State<ScanCardScreen> {
  @override
  Widget build(BuildContext context) {
    //ImagePicker().pickImage(source: ImageSource.camera);
    return Scaffold(
      //appBar: AppBarComplete(title: 'Add a card'),
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              const Material(),
              // Container(
              //   width: 300,
              //   height: 200,
              // ),
              //
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kHugePadding * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Google', style: AppTextStyles.getBodyText(context)),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      S.of(context).scanCardScreen_tabBarTitle,
                      style: AppTextStyles.kMenuTitle(context),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: kSmallPadding),
                    Text(
                      S.of(context).scanCardScreen_tabBarDescription,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
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
                    const SizedBox(height: kDefaultPadding),
                    Text(S.of(context).scanCardScreen_or_text),
                    TextButton(
                        onPressed: () =>
                            AppSnackBarErrors.showSnackBarFeatureUnavailable(
                                context),
                        child: AutoSizeText(
                          S.of(context).scanCardScreen_enterCardManually_title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 0.4),
                          maxFontSize: 14,
                        )),
                    const Spacer(flex: 4),
                    AutoSizeText(
                      S
                          .of(context)
                          .scanCardScreen_makeSureCardHolderNameAnd_bottomNote,
                      textAlign: TextAlign.center,
                      maxFontSize: 13,
                      minFontSize: 10,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
