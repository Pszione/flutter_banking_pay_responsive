import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/screens/googleScreenBase/google_screen_base.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  bool hasFilledForm01 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleScreenBase(
      title: null, // S.of(context).scanCardScreen_tabBarTitle,
      description: null,
      appBar: !WebProvider.isWebPlatform
          ? null
          : AppBarComplete(
              hasNotificationsButton: false,
              hasGoogleAccountAvatar: false,
            ),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.translucent,
        excludeFromSemantics: true,
        child: buildSendMoneyScreen(),
      ),
    );
  }

  Widget buildSendMoneyScreen() {
    final bool hasEnoughSpacing = GoogleScreenBase.hasEnoughSpacing(context);
    const double fontSize = 16.0;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: kSmallPadding, top: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Qual é o valor da transferência?',
              style: AppTextStyles.kMenuTitle(context)
                  .copyWith(fontSize: fontSize * 1.8),
              textAlign: TextAlign.left,
            ),
            Text.rich(
              TextSpan(
                text: 'Amount available in your wallet ',
                style: const TextStyle(fontSize: fontSize),
                children: [
                  TextSpan(
                    text: '\$${172.00}',
                    style: AppTextStyles.kMenuTitle(context)
                        .copyWith(fontSize: fontSize),
                  ),
                ],
              ),
            ),
            buildForms(),
            const SizedBox(height: kHugePadding),
            // accepts numbers and calls the onChanged property on update.

            const SizedBox(height: 80),
          ],
        ),
        // child: Text(
        //   'Amount available in your wallet \$${172.00}',
        //   // style: AppTextStyles.kMenuTitle(context),
        //   style: TextStyle(fontSize: 16),
        //   textAlign: TextAlign.left,
        // ),
      ),
    );
  }

  Widget buildForms() {
    return SizedBox(
      width: double.infinity,
      height: 700,
      child: Padding(
        padding:
            const EdgeInsets.only(top: kHugePadding, bottom: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.black),
              decoration: buildInputDecorationStyle(context, 'R\$ 0,00'),
              keyboardType: TextInputType.number,
              autofocus: true,
              // TODO
              onSubmitted: _updateForm01,
            ),
          ],
        ),
      ),
    );
  }

  void _updateForm01(String value) {
    setState(() {
      hasFilledForm01 = true;
      // scrollToIndex(2);
    });
  }

  void _updateForm02(String value) {}

  InputDecoration buildInputDecorationStyle(
      BuildContext context, String? label) {
    return InputDecoration(
      labelText: label,
      labelStyle: Theme.of(context).textTheme.headline4,
      //errorText: _showValidationError ? 'Invalid number entered' : null,
      border: OutlineInputBorder(
        borderRadius: kDefaultBorderRadius,
      ),
    );
  }
}
