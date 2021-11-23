import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';
import 'package:flutter_banking_pay_responsive/screens/googleScreenBase/google_screen_base.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final double fontSize = 16.0;
  final double HeightSpacingBigFonts = 1;

  final _scrollControllerFixed = FixedExtentScrollController();
  final _textEditing01 = TextEditingController();
  final _textEditing02 = TextEditingController();
  int? _inputWheelIndices;
  List<TextField> inputFieldsOrder = [];
  String filledFormText01 = '0.00';
  String filledFormText02 = 'Second';
  bool hasFilledForm01 = false;
  bool hasFilledForm02 = false;

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
      showGoogleIcon: false,
      appBar: !WebProvider.isWebPlatform
          ? null
          : AppBarComplete(
              hasNotificationsButton: false,
              hasGoogleAccountAvatar: false,
            ),
      child: buildSendMoneyScreen(),
      // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // behavior: HitTestBehavior.translucent,
      // excludeFromSemantics: true,
    );
  }

  // TODO: check _update next index
  void _updateForm01(String value) {
    setState(() {
      hasFilledForm01 = true;
      _inputWheelIndices = 1; // TODO
      if (_textEditing01.value.text.length > 2) {
        filledFormText01 = _textEditing01.value.text;
      }
    });
  }

  void _updateForm02(String value) {
    setState(() {
      hasFilledForm02 = true;
      _inputWheelIndices = 2; // TODO
      if (_textEditing02.value.text.length > 2) {
        filledFormText02 = _textEditing02.value.text;
      }
    });
  }

  Widget buildSendMoneyScreen() {
    final bool hasEnoughSpacing = GoogleScreenBase.hasEnoughSpacing(context);

    inputFieldsOrder = [
      TextField(
        controller: _textEditing01,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.black),
        decoration: buildInputDecorationStyle(
            context, S.of(context).sendMoneyScreen_MONEY_SIGN, false),
        keyboardType: TextInputType.number,
        // TODO: check _update next index
        autofocus: _inputWheelIndices == null || _inputWheelIndices == 0,
        onSubmitted: _updateForm01,
      ),
      TextField(
        controller: _textEditing02,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(color: Colors.black),
        decoration: buildInputDecorationStyle(
            context,
            S
                .of(context)
                .sendMoneyScreen_whomTransferReceiver_field_description,
            true),
        keyboardType: TextInputType.emailAddress,
        // TODO: check _update next index
        autofocus: _inputWheelIndices == 1,
        onSubmitted: _updateForm02,
      ),
    ];

    return SizedBox(
      width: double.infinity,
      height: !WebProvider.isWebPlatform ? 470 : 670,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: kSmallPadding, top: kDefaultPadding),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
                top: kHugePadding, bottom: kDefaultPadding),
            // behavior: AppScrollBehavior(),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: ListWheelScrollView(
                itemExtent: 265,
                controller: _scrollControllerFixed, //  scrollController,
                diameterRatio: 2.5,
                squeeze: 1.0, // 0.9,
                physics: const ClampingScrollPhysics(),
                children: [
                  ResponsiveInputFieldWithConstrained(child: _buildFirstForm()),
                  ResponsiveInputFieldWithConstrained(
                    child: _buildSecondForm(),
                  ),
                  buildContinueButton(context),
                ],
                onSelectedItemChanged: (index) {
                  setState(() {
                    _inputWheelIndices = index;

                    // switch (_inputWheelIndices) {
                    //   case 0:
                    //     inputFieldsOrder[0].onTap?.call();
                    //     break;
                    //   case 1:
                    //     inputFieldsOrder[1].onTap?.call();
                    // }
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstForm() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).sendMoneyScreen_whatTransferAmount_title,
            style: AppTextStyles.kMenuTitle(context).copyWith(
                fontSize: fontSize * 1.8, height: HeightSpacingBigFonts),
            textAlign: TextAlign.left,
          ),
          Text.rich(
            TextSpan(
              text: S.of(context).sendMoneyScreen_walletAvailableAmount,
              style:
                  TextStyle(fontSize: fontSize, height: HeightSpacingBigFonts),
              children: [
                TextSpan(
                  text: ' ${S.of(context).sendMoneyScreen_MONEY_SIGN}${21700}',
                  style: AppTextStyles.kMenuTitle(context)
                      .copyWith(fontSize: fontSize * 1.2, letterSpacing: 1),
                ),
              ],
            ),
            softWrap: true,
          ),
          const SizedBox(height: kDefaultPadding),
          inputFieldsOrder[0],
        ],
      ),
    );
  }

  Widget _buildSecondForm() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: S.of(context).sendMoneyScreen_whomTransferReceiver_title(
                  S.of(context).sendMoneyScreen_MONEY_SIGN, filledFormText01),
              style: AppTextStyles.kMenuTitle(context).copyWith(
                  fontSize: fontSize * 1.8, height: HeightSpacingBigFonts),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: kHugePadding),
          inputFieldsOrder[1],
        ],
      ),
    );
  }

  Widget buildContinueButton(BuildContext context) {
    return ResponsiveWidthConstrained(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kMaxButtonConstraintWidth),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              margin:
                  const EdgeInsets.symmetric(horizontal: kHugePadding * 2.5),
              color: Theme.of(context).scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: kDefaultBorderRadius,
                side:
                    BorderSide(width: 2, color: Theme.of(context).dividerColor),
              ),
              child: TextButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHugePadding * 2, vertical: kDefaultPadding),
                  child: Text(
                    S.of(context).sendMoneyScreen_continue_button_title,
                    softWrap: false,
                  ),
                ),
                // TODO: check _update next index
                autofocus: _inputWheelIndices == 2,
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  InputDecoration buildInputDecorationStyle(
      BuildContext context, String? label, bool smallerText) {
    return InputDecoration(
      labelText: label,
      labelStyle: smallerText
          ? Theme.of(context).textTheme.headline5
          : Theme.of(context).textTheme.headline4,
      //errorText: _showValidationError ? 'Invalid number entered' : null,
      border: OutlineInputBorder(
        borderRadius: kDefaultBorderRadius,
      ),
    );
  }

  Widget ResponsiveInputFieldWithConstrained({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: WebProvider.isWebPlatform ? 0 : kDefaultPadding),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: kMaxButtonConstraintWidth),
          child: child,
        ),
      ),
    );
  }
}
