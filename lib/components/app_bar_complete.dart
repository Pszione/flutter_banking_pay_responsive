import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:provider/provider.dart';

import '../constant_text_styles.dart';
import '../constants.dart';
import '../data_providers.dart';
import 'google_account_dialog.dart';

class AppBarComplete extends StatefulWidget implements PreferredSizeWidget {
  const AppBarComplete(
      {Key? key,
      required this.title,
      this.hasSearchField = false,
      this.hasNotificationsButton = true,
      this.hasDarkThemeToggle = false,
      this.excludeTitleFromSemantics = true})
      : super(key: key);
  final String? title;
  final bool hasSearchField;
  final bool hasNotificationsButton;
  final bool hasDarkThemeToggle;
  final bool excludeTitleFromSemantics;

  @override
  State<AppBarComplete> createState() => _AppBarCompleteState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarCompleteState extends State<AppBarComplete> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final dbProvider = Provider.of<DBSyncProvider>(context);
    bool anyNewNotificationsToDisplay =
        dbProvider != null && dbProvider.newNotifications > 0;

    return Semantics(
      namesRoute: true,
      label: '${widget.title}',
      focusable: false,
      readOnly: true,
      child: AppBar(
        centerTitle: true,
        title: isSearching ? SearchBarField() : showTitleOrNull(context),
        automaticallyImplyLeading: true,
        leadingWidth: 99,
        leading: Row(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!widget.hasNotificationsButton) // false
              Semantics(
                sortKey: const OrdinalSortKey(0),
                child: IconButton(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () => Navigator.maybePop(context, 'Back'),
                  tooltip: 'Back',
                ),
              ),
            // if (widget.hasNotifications)
            //   IconButton(
            //     padding: const EdgeInsets.only(left: kDefaultPadding),
            //     icon: const Icon(
            //       Icons.notifications_active_outlined,
            //     ),
            //     onPressed: () => Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (BuildContext context) =>
            //             const ActivityInsightsScreen(),
            //         maintainState: true,
            //       ),
            //     ),
            //   ),
            if (widget.hasNotificationsButton)
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Semantics(
                    child: IconButton(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ActivityInsightsScreen(),
                          maintainState: true,
                        ),
                      ),
                      tooltip: 'Notifications',
                    ),
                    hint: '${dbProvider.newNotifications} new notifications',
                  ),
                  if (anyNewNotificationsToDisplay)
                    Positioned(
                      top: 2,
                      right: -6, // positioned made it work
                      child: Container(
                        width: kSmallIconSize02 * 1.1,
                        height: kSmallIconSize02 * 1.1,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                          // border: Border.all(
                          //     width: 1.0, color: Theme.of(context).primaryColor),
                        ),
                        child: Center(
                          child: ExcludeSemantics(
                            child: Text(
                              '${dbProvider.newNotifications}',
                              style: AppTextStyles.kSmallWhiteSubtitle(context)
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
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
                icon: const Icon(
                  Icons.search_rounded,
                ),
                onPressed: () => {
                  setState(() {
                    isSearching = !isSearching;
                  })
                },
                tooltip: 'Search whole app',
              ),
          ],
        ),
        actions: [
          if (widget.hasDarkThemeToggle)
            Semantics(
              child: Switch.adaptive(
                value: themeProvider.isDarkMode,
                onChanged: (bool value) {
                  //final provider = Provider.of<ThemeProvider>(context);
                  themeProvider.toggleTheme(value);
                },
                activeColor: kSecondaryColor,
              ),
              label: 'Dark theme',
            ),
          IconButton(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            icon: const CircleAvatar(
              // backgroundImage:
              //     NetworkImage('https://placeimg.com/640/480/people'),
              backgroundImage:
                  AssetImage('assets/images/35244548_pedro_santos.png'),
              backgroundColor: kComplementaryColor,
            ),
            iconSize: kHugeIconSize,
            onPressed: () =>
                GoogleAccountDialog().showDialogDismissible(context),
            tooltip: 'Google account and Settings',
          ),
        ],
      ),
    );
  }

  Widget? showTitleOrNull(BuildContext context) {
    return ExcludeSemantics(
      child: widget.title != null
          ? Text(
              '${widget.title}',
              style: AppTextStyles.getBodyText(context),
            )
          : null,
    );
  }
}

class SearchBarField extends StatelessWidget {
  const SearchBarField({
    Key? key,
  }) : super(key: key);

  //TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.57,
      height: kMediumIconSize * 1.2, // widget.preferredSize.height / 1.6,
      decoration: BoxDecoration(
        borderRadius: kDefaultBorderRadius,
        color: kTextBodyColor.withOpacity(0.85),
      ),
      child: TextField(
        onChanged: (String value) {
          // search by string
        },
        maxLines: 1,
        keyboardType: TextInputType.name,
        style: AppTextStyles.kSmallWhiteSubtitle(context),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search',
          hintStyle: AppTextStyles.kSmallWhiteSubtitle(context),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        ),
      ),
    );
  }
}
