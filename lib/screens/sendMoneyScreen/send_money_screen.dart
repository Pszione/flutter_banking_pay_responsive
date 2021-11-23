import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/screens/googleScreenBase/google_screen_base.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final scrollController = ScrollController();
  final itemController = ItemScrollController();
  // final itemsListener = ItemPositionsListener.create();
  final double _listScrollBottomSpacer = 360.0;
  final double fontSize = 16.0;

  List<Widget> processStepsList = [];
  bool hasFilledForm01 = false;
  bool hasFilledForm02 = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // processStepsList = [];
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
      child: GestureDetector(
        // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        // behavior: HitTestBehavior.translucent,
        // excludeFromSemantics: true,
        child: buildSendMoneyScreen(),
      ),
      // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      // behavior: HitTestBehavior.translucent,
      // excludeFromSemantics: true,
    );
  }

  Widget buildSendMoneyScreen() {
    final bool hasEnoughSpacing = GoogleScreenBase.hasEnoughSpacing(context);

    return SizedBox(
      width: double.infinity,
      height: 470,
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: kSmallPadding, top: kDefaultPadding),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
                top: kHugePadding, bottom: kDefaultPadding),
            child: ListWheelScrollView(
              itemExtent: 245,
              controller: scrollController,
              diameterRatio: 2.5,
              squeeze: 1.0, // 0.9,
              physics: const ClampingScrollPhysics(),
              children: [
                ResponsiveInputFieldWithConstrained(child: _buildFirstForm()),
                ResponsiveInputFieldWithConstrained(child: _buildSecondForm()),
              ],
              // physics: const FixedExtentScrollPhysics(),
              // itemScrollController: itemController,
              // itemPositionsListener: itemsListener,
              // itemCount: processStepsList.length,
              // itemBuilder: (context, index) {
              //   var emptySizedBox = const SizedBox.shrink();
              //
              //   if (processStepsList.isEmpty) {
              //     print('error: SizedBox.shrink');
              //     return emptySizedBox;
              //   }
              //   //
              //   if (index == 0) {
              //     return processStepsList[index];
              //   } else if (index == 1) {
              //     return hasFilledForm01 ? processStepsList[index] : emptySizedBox;
              //   } else {
              //     return emptySizedBox;
              //   }
              // },
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
          TextField(
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black),
            decoration: buildInputDecorationStyle(context, 'R\$', false),
            keyboardType: TextInputType.number,
            autofocus: true,
            // TODO
            onSubmitted: _updateForm01,
          ),
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
          TextField(
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black),
            decoration: buildInputDecorationStyle(
                context, 'Name, phone, SSN, EIN', true),
            keyboardType: TextInputType.number,
            autofocus: true,
            // TODO
            onSubmitted: _updateForm02,
          ),
        ],
      ),
    );
  }

  void _updateForm01(String value) {
    hasFilledForm01 = true;
    // scrollToItem(next);
  }

  void _updateForm02(String value) {
    hasFilledForm02 = true;
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
