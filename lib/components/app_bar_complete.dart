import 'package:flutter/material.dart';

import '../constant_text_styles.dart';
import '../constants.dart';

class AppBarComplete extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComplete(
      {Key? key,
      required this.title,
      this.hasSearchField = false,
      this.hasNotifications = true})
      : super(key: key);
  final String? title;
  final bool hasSearchField;
  final bool hasNotifications;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: title != null
          ? Text(
              '$title',
              style: AppTextStyle.kMenuTitle,
            )
          : null,
      automaticallyImplyLeading: true,
      leadingWidth: 100,
      leading: Row(
        children: [
          if (hasNotifications)
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
          if (hasSearchField)
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: kDarkColor,
                size: kMediumIconSize,
              ),
              onPressed: () {},
            )
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
