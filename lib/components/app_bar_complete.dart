import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:provider/provider.dart';

import '../constant_text_styles.dart';
import '../constants.dart';
import '../theme_provider.dart';

class AppBarComplete extends StatefulWidget implements PreferredSizeWidget {
  const AppBarComplete(
      {Key? key,
      required this.title,
      this.hasSearchField = false,
      this.hasNotifications = true,
      this.hasDarkThemeToggle = false})
      : super(key: key);
  final String? title;
  final bool hasSearchField;
  final bool hasNotifications;
  final bool hasDarkThemeToggle;

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

    return AppBar(
      centerTitle: true,
      title: widget.title != null && !isSearching
          ? Text(
              '${widget.title}',
              style: AppTextStyle.kMenuTitle,
            )
          : null,
      automaticallyImplyLeading: true,
      leadingWidth: MediaQuery.of(context).size.width * 0.8, // 100,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (widget.hasNotifications)
            IconButton(
              // padding: EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: kDefaultPadding),
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: kDarkColor,
                size: kMediumIconSize,
              ),
              onPressed: () {},
            ),
          // TODO: make it clickable
          if (widget.hasSearchField)
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: kDarkColor,
                size: kMediumIconSize,
              ),
              onPressed: () => {
                setState(() {
                  isSearching = !isSearching;
                })
              },
            ),
          if (widget.hasSearchField && isSearching)
            Container(
              width: MediaQuery.of(context).size.width * 0.57,
              height:
                  kMediumIconSize * 1.2, // widget.preferredSize.height / 1.6,
              decoration: BoxDecoration(
                  borderRadius: kDefaultBorderRadius, color: kPrimaryColor),
            ),
        ],
      ),
      actions: [
        IconButton(
          padding: const EdgeInsets.only(right: kDefaultPadding),
          icon: const CircleAvatar(
            backgroundImage:
                NetworkImage('https://placeimg.com/640/480/people'),
            backgroundColor: kComplementaryColor,
          ),
          iconSize: kHugeIconSize,
          onPressed: () {},
        ),
        if (widget.hasDarkThemeToggle)
          Switch.adaptive(
            value: themeProvider.isDarkMode,
            onChanged: (bool value) {
              //final provider = Provider.of<ThemeProvider>(context);
              themeProvider.toggleTheme(value);
            },
            activeColor: kTertiaryColor,
          ),
      ],
    );
  }
}
