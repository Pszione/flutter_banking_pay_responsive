import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../../main.dart';
import '../../../../layers/layers.dart';
import '../../ui.dart';

// ignore_for_file: curly_braces_in_flow_control_structures
class HomeScreen extends StatefulWidget with ChangeNotifier {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<HomeScreenState> keyScreen = GlobalKey<HomeScreenState>();
  late ValueKey<HomeScreenState> keyValueScreen;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HomeScreenController controller = G<HomeScreenController>();

  bool _isFloatingButtonVisible = true;
  final ValueNotifier<bool> openCloseStateFAB = ValueNotifier(false);
  final ValueNotifier<bool> openCloseStateSearch = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    widget.keyValueScreen = ValueKey(this);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      MyApp.changeWebAppTabName(label: null);
      print(Localizations.localeOf(context));
    });
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  Future<void> openFAB() async {
    setState(() {
      _isFloatingButtonVisible = true;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    openCloseStateFAB.value = true; // toggle
  }

  Future<void> openFAB_quickAction() async {
    await Future.delayed(const Duration(milliseconds: 500));
    openCloseStateFAB.value = true; // toggle
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Provider.of<HomeScreen>(context, listen: false)
            .keyValueScreen
            .value
            .openCloseStateFAB
            .value = false;
        return Future.value(false);
      },
      child: Scaffold(
        // key: widget.keyScreen,
        appBar: AppBarComplete(
          title: S.of(context).homeScreen_first_tabBarTitle,
          hasSearchField: true,
          hasDarkThemeToggle: true,
          openCloseStateSearch: openCloseStateSearch,
          googleAvatarThumbnail:
              Provider.of<DBSyncProvider>(context, listen: false)
                  .user
                  .avatarThumbnail,
        ),
        bottomNavigationBar:
            Provider.of<NavigationBarShared>(context, listen: false)
                .getNavigationBar,
        floatingActionButton: _isFloatingButtonVisible
            ? AppFloatingButtonSpeedDial(
                label: S.of(context).homeScreen_fab_title,
                icon: Icons.read_more_rounded,
                tooltip: S.of(context).homeScreen_TOOLTIP_fab_options,
                openCloseState: openCloseStateFAB,
              )
            : AppFloatingButtonSpeedDial(
                label: null,
                icon: Icons.read_more_rounded,
                tooltip: S.of(context).homeScreen_TOOLTIP_fab_options,
                openCloseState: openCloseStateFAB,
              ),
        floatingActionButtonLocation: kFloatingButtonLocationFixed(context),
        body: NotificationListener<UserScrollNotification>(
          onNotification: handleUserScrollState,
          child: KeyboardUnfocusGestureDetector(
            child: PageStorage(
              bucket: bucketStorageForHomeScreen,
              child: Scrollbar(
                isAlwaysShown: WebProvider.isWebPlatform,
                // showTrackOnHover: WebProvider.isWebPlatform,
                child: ListView(
                  key: const PageStorageKey<String>('homeScreenKey'),
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: !WebProvider.isWebPlatform
                          ? EdgeInsets.zero
                          : kPageSpacing.copyWith(top: 0, bottom: 0),
                      child: ResponsiveWidthConstrained(
                        child: Semantics(
                          child: UserCardsSection(desiredPadding: kPageSpacing),
                          label: S
                              .of(context)
                              .homeScreen_userCardSection_pageSubtitle,
                          slider: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: kHalfPadding),
                    Padding(
                      padding: kPageSpacing,
                      child: ResponsiveWidthConstrained(
                          child: Semantics(
                              child: CategoriesSection(
                        onPressList: [
                          () => openFAB(),
                        ],
                      ))),
                    ),
                    const SizedBox(height: kHalfPadding),
                    Padding(
                        padding: kPageSpacing,
                        child: ResponsiveWidthConstrained(
                          child: Semantics(
                              child: const RecentTransactionsSection()),
                        )),
                    const SizedBox(height: kHalfPadding),
                    Padding(
                        padding: !WebProvider.isWebPlatform
                            ? EdgeInsets.zero
                            : kPageSpacing.copyWith(top: 0, bottom: 0),
                        child: ResponsiveWidthConstrained(
                          child: Semantics(
                              child: NewsSection(desiredPadding: kPageSpacing)),
                        )),
                    const SizedBox(height: kDefaultPadding),
                    const SizedBox(height: kDefaultPadding),
                    ResponsiveWidthConstrained(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                            maxWidth: kMaxButtonConstraintWidth),
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: kHugePadding * 2.5),
                          color: Theme.of(context).primaryColorLight,
                          shape: RoundedRectangleBorder(
                            borderRadius: kDefaultBorderRadius,
                            side: BorderSide(width: 2, color: kLightGrayColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: kHalfPadding, horizontal: 3),
                            child: BuildGoogleListButton(
                              icon: Icons.settings_rounded,
                              label: S
                                  .of(context)
                                  .googleAccountDialog_settings_button_title,
                              alignment: MainAxisAlignment.center,
                              onPress: () =>
                                  handleOnPressSettingsButton(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleOnPressSettingsButton(BuildContext context) {
    Navigator.of(context).pushNamed(RouteController.routeSettings);
  }

  bool handleUserScrollState(notification) {
    // Get screen page scroll and block children widget listviews scroll notifications
    if (notification.metrics.axis != Axis.vertical) {
      return true;
    }
    if (notification.direction == ScrollDirection.forward) {
      if (!_isFloatingButtonVisible)
        setState(() => _isFloatingButtonVisible = true);
    } else if (notification.direction == ScrollDirection.reverse) {
      if (_isFloatingButtonVisible)
        setState(() => _isFloatingButtonVisible = false);
    }
    return true;
  }
}

class ShimmerHomeScreen extends StatelessWidget {
  const ShimmerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: ShimmerProgressIndicator(
      //   child: FloatingActionButton.extended(
      //     clipBehavior: Clip.antiAlias,
      //     onPressed: () {},
      //     label: const Text('hahahahaha'),
      //     icon: const Icon(Icons.send),
      //     backgroundColor:
      //         ShimmerProgressIndicator.themeDependentBaseColor(context),
      //     shape: RoundedRectangleBorder(borderRadius: kDefaultBorderRadius),
      //   ),
      // ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: kBottomNavigationHeight(context),
        color: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // AppBar
            ShimmerProgressIndicator(
              child: Container(
                width: double.infinity,
                height: AppBarComplete().preferredSize.height,
                color: Colors.black,
              ),
            ),
            ResponsiveWidthConstrained(
              /// hide scroll bar on loading shimmer
              child: Scrollbar(
                interactive: false,
                showTrackOnHover: false,
                isAlwaysShown: false,
                thickness: 0.0,
                hoverThickness: 0.0,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    // AppBar safe area
                    SizedBox(height: AppBarComplete().preferredSize.height),
                    // CardWidget List
                    Padding(
                      padding: kPageSpacing.copyWith(right: 0),
                      child: SizedBox(
                        height: 220,
                        child: ListView.separated(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, index) {
                            return const SizedBox(width: kHalfPadding);
                          },
                          itemCount: 5,
                          itemBuilder: (_, index) => ShimmerProgressIndicator(
                              child: CardWidget.defaultDimensionColored),
                        ),
                      ),
                    ),
                    // Categories List
                    Padding(
                      padding: kPageSpacing.copyWith(
                          top: kHugePadding, bottom: kHugePadding),
                      child: SizedBox(
                        height: 70,
                        child: ListView.separated(
                          clipBehavior: Clip.antiAlias,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, index) => const SizedBox(
                              width: kHalfPadding * 1.1, height: kHalfPadding),
                          itemCount: 5,
                          itemBuilder: (_, index) => ShimmerProgressIndicator(
                            child: CategoryCard.defaultDimensionColored,
                          ),
                        ),
                      ),
                    ),
                    // Transactions List
                    Padding(
                      padding: kPageSpacing.copyWith(right: 200),
                      child: ShimmerProgressIndicator(
                        child: Container(
                          height: kHalfPadding * 1.2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: kPageSpacing,
                      child: SizedBox(
                        height: 800,
                        child: ListView.separated(
                          clipBehavior: Clip.antiAlias,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, index) {
                            return const SizedBox(height: kHalfPadding);
                          },
                          itemCount: ksMaxRecentTransactionsCount,
                          itemBuilder: (_, index) => ShimmerProgressIndicator(
                            child: TransactionCard.defaultDimensionColored,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Center(
            //   child: CircularProgressIndicator(
            //       strokeWidth: 6, color: Theme.of(context).colorScheme.primary),
            // ),
          ],
        ),
      ),
    );
  }
}
