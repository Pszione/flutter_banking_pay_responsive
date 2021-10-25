import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
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
                      'Add a card',
                      style: AppTextStyles.kMenuTitle(context),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: kSmallPadding),
                    const Text(
                      'Line it up with the frame\nso we can read the card details',
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    CardOutlineWidget(
                      width: 280,
                      height: 150,
                      backgroundColor: Theme.of(context).primaryColor,
                      label: 'Click to scan',
                      onPress: () async => await ImagePicker().pickVideo(
                        source: ImageSource.camera,
                        maxDuration: const Duration(seconds: 1),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const Text('or'),
                    TextButton(
                        onPressed: () =>
                            AppSnackBarErrors.showSnackBarFeatureUnavailable(
                                context),
                        child: const AutoSizeText(
                          'Enter card details manually',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxFontSize: 13,
                        )),
                    const Spacer(flex: 4),
                    const AutoSizeText(
                      'Make sure cardholder name and other info\nis exactly as it appears on card',
                      textAlign: TextAlign.center,
                      maxFontSize: 10,
                      minFontSize: 8,
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
