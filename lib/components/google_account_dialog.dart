import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_pay_responsive/models/account.dart';
import 'package:flutter_banking_pay_responsive/screens/settingsScreen/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../constant_text_styles.dart';
import '../constants.dart';
import '../data_providers.dart';
import '../utils.dart';
import 'google_list_decorations.dart';

class GoogleAccountDialog {
  GoogleAccountDialog({
    Key? key,
  });

  //late AccountModel currentUser;
  static const double kAccountRowHeight = 60;

  Future<String?> showDialogDismissible(BuildContext context,
      AccountModel? signedInAccount, List<AccountModel>? otherAccounts) async {
    HapticFeedback.heavyImpact();

    return await showDialog<String>(
      context: context,
      useSafeArea: true,
      barrierDismissible: true, // click outside to dismiss
      barrierColor: Colors.black.withOpacity(kAlertOverlayOpacity),
      builder: (_) => Semantics(
        label: 'Google account and other settings',
        sortKey: const OrdinalSortKey(0),
        child: AlertDialog(
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
                Semantics(
                  label: 'Signed in as',
                  child: signedInAccount != null
                      ? buildAccountItem(
                          context,
                          signedInAccount,
                          kSmallIconSize,
                          () => Navigator.pop(context),
                          true,
                        )
                      : const SizedBox(
                          width: double.infinity,
                          height: kAccountRowHeight,
                        ),
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
                      itemCount: otherAccounts!.length,
                      itemBuilder: (_, int index) {
                        if (signedInAccount?.ID == otherAccounts[index].ID) {
                          return const SizedBox(height: 0); // null
                        }
                        return buildAccountItem(
                          _,
                          otherAccounts[index],
                          kSmallIconSize02,
                          () {},
                          false,
                        );
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
                            url: Provider.of<ThemeProvider>(context,
                                        listen: false)
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
      ),
    );
  }

  Stack buildGoogleHeader(BuildContext context) {
    return Stack(
      children: [
        Semantics(
          sortKey: const OrdinalSortKey(1),
          label: '',
          child: IconButton(
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.topLeft,
            icon: const Icon(Icons.close_rounded),
            onPressed: () => Navigator.pop(context, 'X'),
            tooltip: 'Close',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kHalfPadding / 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExcludeSemantics(
                child: Text(
                  'Google',
                  style: AppTextStyles.getBodyText(context),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildAccountItem(
      BuildContext context,
      AccountModel? accountInfo,
      double imageSize,
      GestureTapCallback onPressed,
      bool includeFullSemantics) {
    return SizedBox(
      width: double.infinity,
      height: kAccountRowHeight,
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
                    backgroundImage: accountInfo?.avatarThumbnail != null
                        ? AssetImage(accountInfo!.avatarThumbnail!)
                        : null,
                    backgroundColor: kComplementaryColor,
                    radius: imageSize, // kSmall
                  ),
                  const SizedBox(width: 14),
                  Semantics(
                    hint: 'Account',
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(accountInfo?.fullname ?? 'User Name',
                            style: AppTextStyles.kSmallBoldText()),
                        Semantics(
                          child: Text(
                              accountInfo?.email ?? 'username@email.com',
                              style: AppTextStyles.kSmallText()),
                          excludeSemantics: !includeFullSemantics,
                        ),
                      ],
                    ),
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
        child: Semantics(
          label: 'Read',
          child: Text(
            'Privacy Policy',
            maxLines: 1,
            style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      ),
      const ExcludeSemantics(child: Text('•')),
      TextButton(
        onPressed: () =>
            Https.launchURL(url: 'https://policies.google.com/terms'),
        child: Semantics(
          label: 'Read',
          child: Text(
            'Terms of Service',
            maxLines: 1,
            style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
      )
    ];
  }
}
