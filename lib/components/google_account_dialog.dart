import 'package:flutter/material.dart';

import '../constant_text_styles.dart';
import '../constants.dart';

class GoogleAccountDialog {
  const GoogleAccountDialog({
    Key? key,
  });

  Future<String?> showDialogDismissible(BuildContext context) {
    return showDialog<String>(
      context: context,
      barrierDismissible: true, // click outside to dismiss
      useSafeArea: true,
      barrierColor: Colors.black.withOpacity(0.70),
      builder: (BuildContext context) => AlertDialog(
        title: buildGoogleHeader(context),
        elevation: 0,
        titlePadding: const EdgeInsets.all(kHalfPadding),
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kHugePadding),
        shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
        backgroundColor: Theme.of(context).colorScheme.background,
        content: SingleChildScrollView(
          child: Container(
            width: 400, // MediaQuery.of(context).size.width * 0.9,
            height: 400,
            child: Column(
              children: [
                Text('Hello, Pedro Santos'),
                kDivider,
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: InkWell(
                        splashColor: Theme.of(context).colorScheme.secondary,
                        child: BorderDefaultPadding(
                          child: Row(
                            children: [
                              const Icon(Icons.person_add,
                                  size: kSmallIconSize),
                              const SizedBox(width: 14),
                              Text(
                                'Add another account',
                                style: AppTextStyles.kSmallBoldText(),
                              )
                            ],
                          ),
                        ),
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    kDivider,
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: InkWell(
                        splashColor: Theme.of(context).colorScheme.secondary,
                        child: BorderDefaultPadding(
                          child: Row(
                            children: [
                              const Icon(Icons.settings_rounded,
                                  size: kSmallIconSize),
                              const SizedBox(width: 14),
                              Text(
                                'Settings',
                                style: AppTextStyles.kSmallBoldText(),
                              )
                            ],
                          ),
                        ),
                        // TODO: add link
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: InkWell(
                        splashColor: Theme.of(context).colorScheme.secondary,
                        child: BorderDefaultPadding(
                          child: Row(
                            children: [
                              const Icon(Icons.help_outline_sharp,
                                  size: kSmallIconSize),
                              const SizedBox(width: 14),
                              Text(
                                'Help',
                                style: AppTextStyles.kSmallBoldText(),
                              )
                            ],
                          ),
                        ),
                        // TODO: add FAQ link
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                kDivider
              ],
            ),
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actionsPadding: EdgeInsets.zero,
        actions: buildPolicyAndTermsButtons(context),
      ),
    );
  }

  List<Widget> buildPolicyAndTermsButtons(BuildContext context) {
    return <Widget>[
      TextButton(
        onPressed: () => {},
        child: Text(
          'Privacy Policy',
          style: TextStyle(
              fontSize: 12, color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      const Text('•'),
      TextButton(
        onPressed: () => {},
        child: Text(
          'Terms of Service',
          style: TextStyle(
              fontSize: 12, color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    ];
  }

  Stack buildGoogleHeader(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          // padding: const EdgeInsets.only(
          //     left: kHalfPadding / 2, top: kHalfPadding / 2),
          alignment: Alignment.topLeft,
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context, 'X'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kHalfPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Google', style: AppTextStyles.getBodyText(context))
            ],
          ),
        )
      ],
    );
  }
}

class BorderDefaultPadding extends StatelessWidget {
  const BorderDefaultPadding({
    Key? key,
    this.child,
  }) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: child,
    );
  }
}
