import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../../layers/layers.dart';
import '../../ui.dart';

class GoogleAccountDialog {
  GoogleAccountDialog({
    Key? key,
  });

  static const double _kAccountRowHeight = 66;

  Future<Object?> showDialogDismissible(BuildContext context,
      GoogleAccountDialogScreenController controller) async {
    // TODO: create observer pattern
    HapticFeedback.heavyImpact();
    handleSystemUIColor(
        context, Colors.black.withOpacity(kAlertOverlayOpacity));

    return await showDialog<Object>(
      context: context,
      useSafeArea: true,
      barrierDismissible: true, // click outside to dismiss
      barrierColor: Colors.black.withOpacity(kAlertOverlayOpacity),
      builder: (context) => WillPopScope(
        onWillPop: () {
          // TODO: create observer pattern
          handleSystemUIColor(context, null);
          return Future.value(true);
        },
        child: AlertDialog(
          // elevation: 0,
          semanticLabel: "",
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
          titlePadding: const EdgeInsets.fromLTRB(
            kDefaultPadding,
            kHalfPadding,
            kDefaultPadding,
            0,
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: buildExternalPadding(context),
          title: buildGoogleHeader(context),
          content: Container(
            width: MediaQuery.of(context).orientation == Orientation.portrait
                ? 400
                : 460,
            height:
                MediaQuery.of(context).orientation == Orientation.portrait ||
                        Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.height * 0.545
                    : MediaQuery.of(context).size.height * 0.85,
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              children: [
                buildAccountItem(
                  context,
                  controller.signedInAccount,
                  kSmallIconSize,
                  () {
                    handleSystemUIColor(context, null);
                    Navigator.of(context).pop();
                  },
                  controller.signedInAccount == null
                      ? null
                      : S
                          .of(context)
                          .googleAccountDialog_TOOLTIP_signedInAsAccount_description,
                  true,
                ),
                buildManageAccountButton(
                    context: context,
                    onPress: () => HttpsService.launchURL(
                        url: 'https://myaccount.google.com/',
                        forceWebView: false)),
                const SizedBox(height: kHalfPadding),
                kDivider,
                SizedBox(
                  width: double.infinity,
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 150
                          : 130,
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: controller.otherAccounts!.length,
                    itemBuilder: (_, int index) {
                      // TODO: controller set this
                      if (controller.signedInAccount?.ID ==
                          controller.otherAccounts?[index].ID) {
                        return const SizedBox(height: 0); // null
                      }
                      return buildAccountItem(
                        _,
                        controller.otherAccounts?[index],
                        kSmallIconSize02,
                        () {},
                        S.of(context).googleAccountDialog_TOOLTIP_account_hint,
                        false,
                      );
                    },
                  ),
                ),
                const SizedBox(height: kHalfPadding),
                BuildGoogleListButton(
                    label: S
                        .of(context)
                        .googleAccountDialog_addAnotherAccount_button_title,
                    icon: Icons.person_add,
                    onPress: () {
                      handleSystemUIColor(context, null); // TODO
                      Navigator.of(context).pop();
                    }),
                kDivider,
                BuildGoogleListButton(
                  label:
                      S.of(context).googleAccountDialog_settings_button_title,
                  icon: Icons.settings_rounded,
                  onPress: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ROUTE_SETTINGS_SCREEN);
                  },
                ),
                // TODO: add FAQ link
                BuildGoogleListButton(
                  label: S.of(context).googleAccountDialog_help_button_title,
                  icon: Icons.help_outline_sharp,
                  onPress: () => HttpsService.launchURL(
                      url: Provider.of<ThemeProvider>(context, listen: false)
                              .isDarkMode
                          ? 'https://support.google.com/pay/?dark=1'
                          : 'https://support.google.com/pay/'),
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

  EdgeInsets buildExternalPadding(BuildContext context) {
    return EdgeInsets.only(
      left: kDefaultPadding,
      right: kDefaultPadding,
      bottom: MediaQuery.of(context).orientation == Orientation.portrait ||
              Responsive.isDesktop(context)
          ? 80
          : 0,
    );
  }

  //
  Widget buildGoogleHeader(BuildContext context) {
    return Stack(
      children: [
        Semantics(
          label: '',
          // My IconButton widget
          child: SizedBox(
            width: Theme.of(context).iconTheme.size! * 1.5,
            height: Theme.of(context).iconTheme.size! * 1.5,
            child: Tooltip(
              child: InkWell(
                onTap: () {
                  handleSystemUIColor(context, null);
                  Navigator.pop(context);
                },
                borderRadius: kDefaultBorderRadius,
                child: const Padding(
                  padding: EdgeInsets.only(top: kHalfPadding / 1.8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.close_rounded),
                  ),
                ),
              ),
              message: S.of(context).other_TOOLTIP_closeButton,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: ExcludeSemantics(
            child: Padding(
              padding: const EdgeInsets.only(top: kHalfPadding / 2.5),
              child: Text(
                K_GOOGLE_TEXT,
                style: AppTextStyles.getBodyText(context),
                maxLines: 1,
              ),
            ),
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
      String? prefixSemantics,
      bool includeFullSemantics) {
    return SizedBox(
      width: double.infinity,
      height: _kAccountRowHeight,
      child: Semantics(
        label: prefixSemantics,
        child: InkWell(
          onTap: onPressed,
          child: BorderDefaultPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
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
                    SizedBox(
                      width: 254, // TODO
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            accountInfo?.fullname ??
                                S
                                    .of(context)
                                    .googleAccountDialog_EXAMPLE_fullName,
                            style: AppTextStyles.kSmallBoldText(),
                            maxLines: 2,
                            stepGranularity: 0.2,
                            softWrap: true,
                            wrapWords: false, // important!
                          ),
                          Semantics(
                            child: AutoSizeText(
                              // TODO: fuck
                              accountInfo?.email ??
                                  S
                                      .of(context)
                                      .googleAccountDialog_EXAMPLE_email,
                              style: AppTextStyles.kSmallText(),
                              maxLines: 2,
                              maxFontSize: 13,
                              minFontSize: 6,
                              stepGranularity: 0.2,
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              wrapWords: true, // important!
                            ),
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
      ),
    );
  }

  Widget buildManageAccountButton(
      {required BuildContext context,
      String? label,
      required VoidCallback onPress}) {
    return Center(
      child: Row(
        children: [
          // TODO: is this the right way to sync spacing (with photo above) ?
          const SizedBox(width: 78),
          // width: MediaQuery.of(context).size.width * 0.65,
          Expanded(
            flex: 5,
            child: TextButton(
              child: AutoSizeText(
                label ??
                    S.of(context).googleAccountDialog_manageGoogleAccount_title,
                style: AppTextStyles.kSmallBoldText().copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
                maxLines: 1,
                maxFontSize: 20,
                minFontSize: 11,
                wrapWords: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: StadiumBorder(
                  side: BorderSide(color: kLightGrayColor, width: 2),
                ),
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kHalfPadding * 0.9,
                ),
              ),
              onPressed: onPress,
            ),
          ),
          const SizedBox(width: kDefaultPadding),
        ],
      ),
    );
  }

  List<Widget> buildPolicyAndTermsButtons(BuildContext context) {
    var _autoSizeGroup = AutoSizeGroup();
    double width = 160;
    double height = 40;
    return <Widget>[
      SizedBox(
        width: width,
        height: height,
        child: InkWell(
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble),
          onTap: () => HttpsService.launchURL(
              url: 'https://policies.google.com/privacy'),
          child: Center(
            child: Semantics(
              label: S.of(context).googleAccountDialog_TOOLTIP_readTerms_hint,
              child: AutoSizeText(
                S.of(context).googleAccountDialog_privacyPolicy_button_title,
                maxLines: 1,
                maxFontSize: 12,
                minFontSize: 8,
                group: _autoSizeGroup,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ),
        ),
      ),
      const ExcludeSemantics(child: Text('•')),
      SizedBox(
        width: width * 0.85,
        height: height,
        child: InkWell(
          borderRadius: BorderRadius.circular(kSmallBorderRadiusAsDouble),
          onTap: () =>
              HttpsService.launchURL(url: 'https://policies.google.com/terms'),
          child: Center(
            child: Semantics(
              label: S.of(context).googleAccountDialog_TOOLTIP_readTerms_hint,
              child: AutoSizeText(
                S.of(context).googleAccountDialog_termsOfService_button_title,
                maxLines: 1,
                maxFontSize: 12,
                minFontSize: 8,
                group: _autoSizeGroup,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ),
        ),
      )
    ];
  }
}
