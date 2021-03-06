import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../core/core.dart';
import '../../layers/layers.dart';
import '../ui/ui.dart';

// ignore_for_file: curly_braces_in_flow_control_structures
class AppBarComplete extends StatefulWidget implements PreferredSizeWidget {
  AppBarComplete({
    Key? key,
    this.title,
    this.hasSearchField = false,
    this.hasNotificationsButton = true,
    this.hasDarkThemeToggle = false,
    this.hasGoogleAccountAvatar = true,
    this.excludeTitleFromSemantics = true,
    this.openCloseStateSearch,
    /*required*/ this.googleAvatarThumbnail,
  }) : super(key: key);
  final String? title;
  final bool hasSearchField;
  final bool hasNotificationsButton;
  final bool hasGoogleAccountAvatar;
  final bool hasDarkThemeToggle;
  final bool excludeTitleFromSemantics;
  final String? googleAvatarThumbnail;

  late ValueNotifier<bool>? openCloseStateSearch;

  @override
  State<AppBarComplete> createState() => _AppBarCompleteState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarCompleteState extends State<AppBarComplete> {
  bool isSearching = false;

  @override
  void initState() {
    super.initState();

    widget.openCloseStateSearch?.addListener(_onOpenCloseSearch);
  }

  @override
  void dispose() {
    widget.openCloseStateSearch?.removeListener(_onOpenCloseSearch);
    //
    super.dispose();
  }

  void toggleSearchingField() {
    setState(() {
      isSearching = !isSearching;
      if (widget.openCloseStateSearch != null)
        widget.openCloseStateSearch!.value = isSearching;
    });
  }

  void startSearching() {
    setState(() {
      isSearching = true;
      if (widget.openCloseStateSearch != null)
        widget.openCloseStateSearch!.value = isSearching;
    });
  }

  void _onOpenCloseSearch() {
    final show = widget.openCloseStateSearch?.value;
    if (show == null) return;
    if (!show) {
      setState(() {
        isSearching = false;
      });
    } else if (show) {
      setState(() {
        isSearching = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final dbProvider = Provider.of<DBSyncProvider>(context);
    bool anyNewNotificationsToDisplay = dbProvider.newNotifications > 0;

    return Semantics(
      namesRoute: true,
      label: widget.title,
      focusable: false,
      readOnly: true,
      child: AppBar(
        centerTitle: true,
        title: isSearching ? SearchBarField() : showTitleOrNull(context),
        automaticallyImplyLeading: true,
        leadingWidth: 120,
        leading: Padding(
          padding: EdgeInsets.only(
            left: WebProvider.isWebPlatform && Responsive.isDesktop(context)
                ? kHugePadding
                : kHalfPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!widget.hasNotificationsButton)
                Semantics(
                  sortKey: const OrdinalSortKey(0),
                  child: IconButton(
                    // padding: EdgeInsets.zero,
                    padding: const EdgeInsets.only(left: 7),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    onPressed: () => Navigator.of(context).canPop()
                        ? Navigator.of(context).pop()
                        : {},
                    tooltip: S.of(context).appBar_TOOLTIP_backButton_hint,
                  ),
                ),
              if (widget.hasNotificationsButton)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Semantics(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.notifications_active_outlined,
                          size: kMediumIconSize,
                        ),
                        onPressed: () {
                          Provider.of<SetupScreen>(context, listen: false)
                              .keyValueScreen
                              .value
                              .changeSelectedMenuByState(MenuState.insights);
                        },
                        tooltip: S
                            .of(context)
                            .appBar_notificationsButton_newNotificationsMessage(
                                dbProvider.newNotifications),
                      ),
                      button: true,
                    ),
                    if (anyNewNotificationsToDisplay)
                      Positioned(
                        top: -1.3,
                        right: -5, // positioned made it work
                        child: Container(
                          width: kSmallIconSize02 * 1.15,
                          height: kSmallIconSize02 * 1.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Center(
                            child: ExcludeSemantics(
                              child: AutoSizeText(
                                '${dbProvider.newNotifications}',
                                textAlign: TextAlign.center,
                                style:
                                    AppTextStyles.kSmallWhiteSubtitle(context)
                                        .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                maxFontSize: 15,
                                minFontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              //
              if (widget.hasSearchField)
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.search_rounded,
                    size: kMediumIconSize,
                  ),
                  onPressed: () => toggleSearchingField(),
                  tooltip: S.of(context).appBar_TOOLTIP_searchInput_hint,
                ),
            ],
          ),
        ),
        actions: [
          if (widget.hasDarkThemeToggle)
            Semantics(
              child: Tooltip(
                child: Switch.adaptive(
                  value: themeProvider.isDarkMode,
                  onChanged: (bool value) {
                    themeProvider.toggleTheme(value, context);
                  },
                  activeColor: kSecondaryColor,
                ),
                message: S.of(context).appBar_switchDarkTheme_title,
                excludeFromSemantics: true,
              ),
              label: S.of(context).appBar_switchDarkTheme_title,
              button: true,
            ),
          if (widget.hasGoogleAccountAvatar)
            Padding(
              padding: EdgeInsets.only(
                right:
                    WebProvider.isWebPlatform && Responsive.isDesktop(context)
                        ? kHugePadding
                        : kHalfPadding,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: CircleAvatar(
                  // TODO
                  backgroundImage: widget.googleAvatarThumbnail != null
                      ? AssetImage(widget.googleAvatarThumbnail!)
                      : null,
                  backgroundColor: kComplementaryColor,
                  radius: kHugeIconSize * 1.5,
                ),
                iconSize: kMediumIconSize,
                // TODO: not right
                onPressed: () =>
                    GoogleAccountDialog().showDialogDismissible(context, G()),
                tooltip: S
                    .of(context)
                    .googleAccountDialog_TOOLTIP_googleAccountDialog_description,
              ),
            ),
        ],
      ),
    );
  }

  Widget? showTitleOrNull(BuildContext context) {
    return ExcludeSemantics(
      child: widget.title != null
          ? AutoSizeText(
              '${widget.title}',
              wrapWords: false,
              maxFontSize: 20,
              stepGranularity: 0.5,
              // TODO: not auto sizing
              overflow: TextOverflow.clip,
              style: AppTextStyles.getBodyText(context),
            )
          : null,
    );
  }
}

class SearchBarField extends StatelessWidget {
  SearchBarField({
    Key? key,
  }) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.clear();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: kMaxButtonConstraintWidth),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.57,
        height: kMediumIconSize * 1.2,
        decoration: BoxDecoration(
          borderRadius: kDefaultBorderRadius,
          color: kTextBodyColor.withOpacity(0.85),
        ),
        child: TextField(
          onChanged: (String value) {
            // TODO: search by string
          },
          maxLines: 1,
          keyboardType: TextInputType.name,
          autofocus: true,
          controller: controller,
          style: AppTextStyles.kSmallWhiteSubtitle(context),
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: S.of(context).appBar_searchInput_title,
            hintStyle: AppTextStyles.kSmallWhiteSubtitle(context)
                .copyWith(color: kTextWhiteColor),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
          ),
        ),
      ),
    );
  }
}
