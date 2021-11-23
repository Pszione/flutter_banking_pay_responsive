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
  final scrollController = ScrollController();
  final _scrollControllerFixed = FixedExtentScrollController();
  // final itemsListener = ItemPositionsListener.create();
  final double _listScrollBottomSpacer = 360.0;
  final double fontSize = 16.0;

  int? _inputWheelIndices;
  List<TextField> inputFieldsOrder = [];
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

  //
  void _updateForm01(String value) {
    setState(() {
      hasFilledForm01 = true;
      _inputWheelIndices = 1; // TODO
    });
  }

  void _updateForm02(String value) {
    setState(() {
      hasFilledForm02 = true;
      // _inputWheelIndices = 2; // TODO
    });
  }

  Widget buildSendMoneyScreen() {
    final bool hasEnoughSpacing = GoogleScreenBase.hasEnoughSpacing(context);

    inputFieldsOrder = [
      TextField(
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: Colors.black),
        decoration: buildInputDecorationStyle(context, 'R\$', false),
        keyboardType: TextInputType.number,
        autofocus: _inputWheelIndices == null || _inputWheelIndices == 0,
        // TODO: check _update next index
        onSubmitted: _updateForm01,
      ),
      TextField(
        style: Theme.of(context)
            .textTheme
            .headline4
            ?.copyWith(color: Colors.black),
        decoration:
            buildInputDecorationStyle(context, 'Name, phone, SSN, EIN', true),
        keyboardType: TextInputType.emailAddress,
        autofocus: _inputWheelIndices == 1,
        // TODO: check _update next index
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
                itemExtent: 245,
                controller: _scrollControllerFixed, //  scrollController,
                diameterRatio: 2.5,
                squeeze: 1.0, // 0.9,
                physics: const ClampingScrollPhysics(),
                children: [
                  ResponsiveInputFieldWithConstrained(child: _buildFirstForm()),
                  ResponsiveInputFieldWithConstrained(
                      child: _buildSecondForm()),
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
            'Qual é o valor da transferência?',
            style: AppTextStyles.kMenuTitle(context)
                .copyWith(fontSize: fontSize * 1.8),
            textAlign: TextAlign.left,
          ),
          Text.rich(
            TextSpan(
              text: 'Amount available in your wallet ',
              style: TextStyle(fontSize: fontSize),
              children: [
                TextSpan(
                  text: '\$${172.00}',
                  style: AppTextStyles.kMenuTitle(context)
                      .copyWith(fontSize: fontSize),
                ),
              ],
            ),
          ),
          const SizedBox(height: kHugePadding),
          inputFieldsOrder[0],
          // TextField(
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline4
          //       ?.copyWith(color: Colors.black),
          //   decoration: buildInputDecorationStyle(context, 'R\$', false),
          //   keyboardType: TextInputType.number,
          //   autofocus: true,
          //   // TODO
          //   onSubmitted: _updateForm01,
          // ),
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
              text: 'Para quem você quer transferir ',
              style: AppTextStyles.kMenuTitle(context)
                  .copyWith(fontSize: fontSize * 1.8),
              children: [
                TextSpan(
                  text: '\$${5000.0}?',
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: kHugePadding),
          inputFieldsOrder[1],
          // TextField(
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline4
          //       ?.copyWith(color: Colors.black),
          //   decoration: buildInputDecorationStyle(
          //       context, 'Name, phone, SSN, EIN', true),
          //   keyboardType: TextInputType.number,
          //   autofocus: true,
          //   // TODO
          //   onSubmitted: _updateForm02,
          // ),
        ],
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
