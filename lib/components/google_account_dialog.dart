import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/models/account.dart';
import 'package:flutter_banking_pay_responsive/screens/settingsScreen/settings_screen.dart';
import 'package:provider/provider.dart';

import '../constant_text_styles.dart';
import '../constants.dart';
import '../data_providers.dart';
import '../utils.dart';
import 'google_list_decorations.dart';

class GoogleAccountDialog {
  GoogleAccountDialog({
    Key? key,
  });

  late AccountModel currentUser;

  Future<String?> showDialogDismissible(BuildContext context) async {
    // TODO: use provider reference
    currentUser = Provider.of<DBSyncProvider>(context, listen: false).user;
    print(currentUser.fullname);

    return await showDialog<String>(
      context: context,
      useSafeArea: true,
      barrierDismissible: true, // click outside to dismiss
      barrierColor: Colors.black.withOpacity(0.70),
      builder: (_) => AlertDialog(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
        titlePadding: const EdgeInsets.fromLTRB(
            kDefaultPadding, kHalfPadding, kDefaultPadding, 0),
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.only(
            left: kDefaultPadding,
            right: kDefaultPadding,
            bottom: MediaQuery.of(context).orientation == Orientation.portrait
                ? 99
                : 0),
        title: buildGoogleHeader(context),
        content: SizedBox(
          width: 400, // MediaQuery.of(context).size.width * 0.9,
          height: 420,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildAccountItem(
                context,
                currentUser.fullname!,
                currentUser.email!,
                currentUser.avatarThumbnail,
                kSmallIconSize,
                () => Navigator.pop(context),
              ),
              if (MediaQuery.of(context).orientation == Orientation.portrait)
                buildManageAccountButton(
                    context: context,
                    onPress: () => Https.launchURL(
                        url: 'https://myaccount.google.com/',
                        forceWebView: false)),
              const SizedBox(height: kHalfPadding),
              kDivider,
              SizedBox(
                height: 165,
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: myAccounts.length,
                    itemBuilder: (_, int index) {
                      if (currentUser.ID == myAccounts[index].ID) {
                        return const SizedBox(height: 0); // null
                      }
                      return buildAccountItem(
                          _,
                          myAccounts[index].fullname!,
                          myAccounts[index].email!,
                          myAccounts[index].avatar,
                          kSmallIconSize02,
                          () {});
                    }),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BuildGoogleListButton(
                      label: 'Add another account',
                      icon: Icons.person_add,
                      onPress: () => Navigator.pop(context)),
                  kDivider,
                  BuildGoogleListButton(
                    label: 'Settings',
                    icon: Icons.settings_rounded,
                    onPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SettingsScreen())),
                  ),
                  // TODO: add FAQ link
                  BuildGoogleListButton(
                      label: 'Help',
                      icon: Icons.help_outline_sharp,
                      onPress: () => Https.launchURL(
                          url:
                              Provider.of<ThemeProvider>(context, listen: false)
                                      .isDarkMode
                                  ? 'https://support.google.com/pay/?dark=1'
                                  : 'https://support.google.com/pay/')),
                ],
              ),
              kDivider
            ],
          ),
        ),
        actionsPadding: EdgeInsets.zero,
        actionsAlignment: MainAxisAlignment.center,
        actions: buildPolicyAndTermsButtons(context),
        buttonPadding: EdgeInsets.zero,
      ),
    );
  }

  Stack buildGoogleHeader(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          padding: const EdgeInsets.symmetric(vertical: 8),
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
      String? imagePath, double imageSize, GestureTapCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: InkWell(
        onTap: onPressed,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: BorderDefaultPadding(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox?
                  CircleAvatar(
                    backgroundImage:
                        imagePath != null ? AssetImage(imagePath) : null,
                    backgroundColor: kComplementaryColor,
                    radius: imageSize, // kSmall
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
      ),
    );
  }

  TextButton buildManageAccountButton(
      {required BuildContext context,
      String label = 'Manage your Google Account',
      required VoidCallback onPress}) {
    return TextButton(
      child: Text(
        label,
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
      onPressed: onPress,
    );
  }

  List<Widget> buildPolicyAndTermsButtons(BuildContext context) {
    return <Widget>[
      TextButton(
        onPressed: () =>
            Https.launchURL(url: 'https://policies.google.com/privacy'),
        child: Text(
          'Privacy Policy',
          maxLines: 1,
          style: TextStyle(
              fontSize: 12, color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
      const Text('•'),
      TextButton(
        onPressed: () =>
            Https.launchURL(url: 'https://policies.google.com/terms'),
        child: Text(
          'Terms of Service',
          maxLines: 1,
          style: TextStyle(
              fontSize: 12, color: Theme.of(context).colorScheme.onBackground),
        ),
      )
    ];
  }
}
