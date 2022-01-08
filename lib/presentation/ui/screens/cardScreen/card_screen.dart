import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/core/route_controller.dart';
import 'package:flutter_banking_pay_responsive/presentation/controllers/card_screen_controller.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/app_floating_button_with_icon_and_text.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/app_sliding_bottom_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_add_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_overview_sliding_sheet.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/designSystem/constants.dart';
import 'package:flutter_banking_pay_responsive/presentation/controllers/data_providers.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/main.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/designSystem/responsive.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/screens/homeScreen/home_screen.dart';
import 'package:flutter_banking_pay_responsive/presentation/widgets/card_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget with ChangeNotifier {
  CardScreen({Key? key}) : super(key: key);

  final GlobalKey<CardScreenState> keyScreen = GlobalKey<CardScreenState>();
  late ValueKey<CardScreenState> keyValueScreen;

  @override
  State<CardScreen> createState() => CardScreenState();
}

class CardScreenState extends State<CardScreen> {
  var controller = GetIt.I<CardScreenController>();

  Axis _currentScrollAxis = Axis.vertical;
  bool _isAxisVertical = true;

  @override
  void initState() {
    super.initState();

    widget.keyValueScreen = ValueKey(this);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      MyApp.changeWebAppTabName(
          label: S.of(context).homeScreen_second_tabBarTitle);
    });
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentScrollAxis = Responsive.isMobileLarge(context)
        ? Axis.vertical
        : Axis.vertical; // TODO Axis.horizontal;
    _isAxisVertical = _currentScrollAxis == Axis.vertical;

    return Scaffold(
      key: widget.keyScreen,
      appBar: AppBarComplete(
        title: S.of(context).homeScreen_second_tabBarTitle,
        hasNotificationsButton: true,
        hasDarkThemeToggle: true,
        googleAvatarThumbnail:
            Provider.of<DBSyncProvider>(context, listen: false)
                .user
                .avatarThumbnail,
      ),
      floatingActionButton: AppFloatingButtonIconAndText(
        label: S.of(context).cardScreen_fab_title,
        tooltip: S.of(context).cardScreen_TOOLTIP_fab_options,
        icon: Icons.add,
        onPressed: () => handleOnPressFab(context),
      ),
      floatingActionButtonLocation: kFloatingButtonLocationAdaptive(context),
      bottomNavigationBar:
          Provider.of<NavigationBarShared>(context, listen: false)
              .getNavigationBar,
      body: PageStorage(
        bucket: bucketStorageForCardScreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex:
                  MediaQuery.of(context).orientation == Orientation.portrait ||
                          Responsive.isDesktop(context)
                      ? 6
                      : 500, // no flex
              // TODO: almost a copy of [UserCardsSection] widget in HomeScreen
              child: Scrollbar(
                isAlwaysShown: WebProvider.isWebPlatform,
                child: ListView.separated(
                  key: const PageStorageKey<String>('cardScreenUserCardsKey'),
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: _currentScrollAxis,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                        width: kHalfPadding, height: kDefaultPadding);
                  },
                  shrinkWrap: true,
                  itemCount: controller.cards.length + 1,
                  itemBuilder: (_, index) {
                    if (index == controller.cards.length) {
                      // because of +1 in length I have to return something
                      return !_isAxisVertical
                          ? CardWidget.defaultDimension
                          : const SizedBox.shrink();
                    }
                    return ResponsiveWidthConstrained(
                      child: Center(
                        child: CardWidget(
                          card: controller.cards[index],
                          index: index,
                          onPress: () => handleOnPressCard(context, index),
                        ),
                      ),
                    );
                  },
                  padding: kPageSpacing.copyWith(bottom: kPageSpacing.top),
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                height: kHugePadding * 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleOnPressFab(BuildContext context) async {
    await CardAddSlidingSheet().showOptionsSlidingSheet(context);
    // onPressed: () => const AppAlertDialog(
    //   title: 'Add Card',
    //   contentText: null,
    // ).showAlertDialogDismissible(context),
    // AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
  }

  Future<void> handleOnPressCard(BuildContext context, int index) {
    return AppSlidingBottomSheet(
      context: context,
      initialSnap: _isAxisVertical ? 0.5 : 1.0,
      headerColor: controller.getCardColorNullSafety(controller.cards[index],
          opacity: 0.85),
      bodyWidget: CardOverviewSlidingSheet(card: controller.cards[index]),
    ).showStyledSheet();
  }
}
