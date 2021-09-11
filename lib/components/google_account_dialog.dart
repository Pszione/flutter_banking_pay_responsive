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
      useSafeArea: true,
      barrierDismissible: true, // click outside to dismiss
      barrierColor: Colors.black.withOpacity(0.70),
      builder: (BuildContext context) => AlertDialog(
        title: buildGoogleHeader(context),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
        titlePadding: const EdgeInsets.all(kHalfPadding),
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kHugePadding),
        // TODO: scroll is not working
        content: SingleChildScrollView(
          child: SizedBox(
            width: 400, // MediaQuery.of(context).size.width * 0.9,
            height: 420,
            child: Column(
              children: [
                buildAccountItem(
                  context,
                  'Pedro Santos',
                  'pedrinho554@gmail.com',
                  'assets/images/35244548_pedro_santos.png',
                  () => Navigator.pop(context),
                ),
                buildManageAccountButton(context),
                const SizedBox(height: kHalfPadding),
                kDivider,
                Column(
                  children: [
                    buildAccountItem(
                      context,
                      'Oused Games',
                      'ousedgames@gmail.com',
                      'assets/icons/logo_master_card.png',
                      () {},
                    ),
                    buildAccountItem(
                      context,
                      'Eu Acredito Na Humanidade',
                      'euacreditoblog@gmail.com',
                      'assets/images/_earth_TEST07B.jpg',
                      () {},
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildListButtonItem(context, 'Add another account',
                        Icons.person_add, () => Navigator.pop(context)),
                    kDivider,
                    // TODO: add link
                    buildListButtonItem(context, 'Settings',
                        Icons.settings_rounded, () => Navigator.pop(context)),
                    // TODO: add FAQ link
                    buildListButtonItem(context, 'Help',
                        Icons.help_outline_sharp, () => Navigator.pop(context)),
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

  SizedBox buildAccountItem(BuildContext context, String label, String email,
      String? imagePath, GestureTapCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondary,
        child: BorderDefaultPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        imagePath != null ? AssetImage(imagePath) : null,
                    backgroundColor: kComplementaryColor,
                    radius: kSmallIconSize,
                  ),
                  const SizedBox(width: 14),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(label, style: AppTextStyles.kSmallBoldText()),
                      Text(email, style: AppTextStyles.kSmallText()),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: onPressed,
      ),
    );
  }

  TextButton buildManageAccountButton(BuildContext context) {
    return TextButton(
      child: Text(
        'Manage your Google Account',
        style: AppTextStyles.kSmallBoldText()
            .copyWith(color: Theme.of(context).primaryColorDark),
        maxLines: 1,
        overflow: TextOverflow.visible,
      ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape:
            StadiumBorder(side: BorderSide(color: kLightGrayColor, width: 2)),
        elevation: 0,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kHalfPadding * 0.9),
      ),
      onPressed: () {},
    );
  }

  SizedBox buildListButtonItem(BuildContext context, String label,
      IconData icon, GestureTapCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.secondary,
        child: BorderDefaultPadding(
          child: Row(
            children: [
              Icon(icon, size: kSmallIconSize),
              const SizedBox(width: 14),
              Text(
                label,
                style: AppTextStyles.kSmallBoldText(),
              )
            ],
          ),
        ),
        onTap: onPressed,
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
