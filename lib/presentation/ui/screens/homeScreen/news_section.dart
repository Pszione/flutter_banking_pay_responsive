import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../layers/layers.dart';
import '../../ui.dart';

class NewsSection extends StatelessWidget {
  NewsSection({Key? key, required this.desiredPadding}) : super(key: key);

  // TODO: should only depend on a repository
  final HomeScreenController controller = G<HomeScreenController>();
  final EdgeInsets desiredPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: !WebProvider.isWebPlatform ? null : kDefaultBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: !WebProvider.isWebPlatform ? desiredPadding.left : 0,
              top: desiredPadding.top / 2,
              right: desiredPadding.left,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Semantics(
                  child: Text(
                    S
                        .of(context)
                        .homeScreen_news_pageSubtitle, // S.of(context).
                    style: AppTextStyles.kMenuTitle(context),
                  ),
                  header: true,
                ),
                Text(
                  S.of(context).homeScreen_news_dismissText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 230,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: kHugePadding);
                },
                itemCount: controller.news.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.news.length) {
                    return const SizedBox(width: kHugePadding);
                  }

                  return buildNewsCard(context, index);
                },
                padding: EdgeInsets.only(
                  left: !WebProvider.isWebPlatform ? desiredPadding.left : 0,
                  right: !WebProvider.isWebPlatform ? desiredPadding.right : 0,
                  top: desiredPadding.top / 2,
                  bottom: desiredPadding.top,
                ),
              ),
            ),
          ),
          const SizedBox(height: kHalfPadding),
        ],
      ),
    );
  }

  Widget buildNewsCard(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? 250
          : 300,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: kDefaultBorderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding,
          right: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // controller.news[index].title ?? 'Check it out!',
              controller.news[index]
                  .getLocalizedTitle(Localizations.localeOf(context)),
              style: AppTextStyles.kListTileTitle
                  .copyWith(fontSize: 17, height: kTextSmallHeightSpacing),
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
            Text(
              // controller.news[index].description ?? '...',
              controller.news[index]
                  .getLocalizedDescription(Localizations.localeOf(context)),
              style: AppTextStyles.kListTileSubtitle
                  .copyWith(fontSize: 14, height: kTextSmallHeightSpacing),
              maxLines: 5,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {},
                child: Text(
                  S.of(context).homeScreen_seeMore_title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
