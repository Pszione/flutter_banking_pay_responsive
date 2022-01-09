import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../ui.dart';
import '../../../../core/core.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key, required this.onPressList})
      : super(key: key);

  final List<Function> onPressList;

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(width: kHalfPadding * 1.1, height: kHalfPadding);

    // TODO: make categories dynamic and toggle each on or off
    // final categories = <Widget>[];
    //
    // for (var i = 0; i < CategoryModel.categoryNames.length; i++) {
    //   categories.add(
    //     CategoryCard(
    //       label: CategoryModel.categoryNames[i],
    //       icon: CategoryModel.categoryIcons[i],
    //       onPress: () =>
    //         AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
    //     ),
    //   );
    // }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            label: S.of(context).homeScreen_transactions_categoryTitle,
            icon: Icons.read_more_rounded,
            // onPress: () =>
            //     AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
            onPress: () => onPressList.isNotEmpty ? onPressList[0].call() : {},
          ),
          spacing,
          CategoryCard(
            label: S.of(context).homeScreen_billsResume_categoryTitle,
            icon: Icons.view_list_outlined,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          spacing,
          CategoryCard(
            label: S.of(context).homeScreen_salesStore_categoryTitle,
            icon: Icons.shopping_bag_outlined,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),

          spacing,
          CategoryCard(
            label: S.of(context).homeScreen_supportChat_categoryTitle,
            icon: Icons.chat_outlined,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          spacing,
          CategoryCard(
            label: S.of(context).homeScreen_more_categoryTitle,
            icon: Icons.more_horiz,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          //
          // ...List<CategoryCard>.generate(
          //   categories.length,
          //   (int index) => CategoryCard(
          //     icon: categories[index]['icon'],
          //     label: categories[index]['text'],
          //     onPress: () => {},
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.label,
    this.size = kMediumIconSize,
    required this.onPress,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final double size;
  final GestureTapCallback onPress;

  static Widget defaultDimensionColored = SizedBox(
    width: 60, // 350
    height: 60,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 53,
          height: 53,
          decoration: ShapeDecoration(
            color: const Color(0xFF000000),
            shape: RoundedRectangleBorder(
              borderRadius: kDefaultBorderRadius,
              side: const BorderSide(
                width: 3,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 10,
          decoration: ShapeDecoration(
            color: const Color(0xFF000000),
            shape: RoundedRectangleBorder(
              borderRadius: kDefaultBorderRadius,
              side: const BorderSide(
                width: 3,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: kHugeBorderRadius,
      radius: kInkWellMediumRadius,
      onTap: onPress,
      child: SizedBox(
        width: 61,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kSmallPadding / 2),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(kHalfPadding),
                  decoration: BoxDecoration(
                      // color: kGrayColor,
                      color: Theme.of(context).primaryColorLight,
                      borderRadius:
                          BorderRadius.circular(kDefaultBorderRadiusAsDouble),
                      boxShadow: [kBoxDownShadowSubtle]),
                  child: Icon(
                    icon,
                    color: Theme.of(context).primaryColorDark,
                    size: size,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Semantics(
              child: AutoSizeText(
                label,
                maxLines: 2, // for phones with increased font size
                maxFontSize: 12,
                minFontSize: 10,
                stepGranularity: 0.2,
                // wrapWords: false,
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    height: kTextMediumHeightSpacing * 0.8),
              ),
              button: true,
            )
          ],
        ),
      ),
    );
  }
}
