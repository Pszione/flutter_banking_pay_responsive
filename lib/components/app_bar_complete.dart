import 'package:flutter/material.dart';

import '../constant_text_styles.dart';
import '../constants.dart';

class AppBarComplete extends StatefulWidget implements PreferredSizeWidget {
  AppBarComplete(
      {Key? key,
      required this.title,
      this.hasSearchField = false,
      this.hasNotifications = true})
      : super(key: key);
  final String? title;
  final bool hasSearchField;
  final bool hasNotifications;

  @override
  State<AppBarComplete> createState() => _AppBarCompleteState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarCompleteState extends State<AppBarComplete> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
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
          ),
          iconSize: kHugeIconSize,
          onPressed: () {},
        ),
      ],
    );
  }
}
