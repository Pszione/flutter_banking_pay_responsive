import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';
import 'package:flutter_banking_pay_responsive/snackbar_errors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: make categories dynamic and toggle each on or off
    // final List<Map<String, String>> categories = [
    //   <String, String>{
    //     'icon': FontAwesomeIcons.fileInvoice,
    //     'text': 'Bills Resume'
    //   },
    //   <String, String>{
    //     'icon': FontAwesomeIcons.shoppingBag,
    //     'text': 'Sales Store'
    //   },
    //   <String, String>{
    //     'icon': FontAwesomeIcons.solidCommentDots,
    //     'text': 'Support Chat'
    //   },
    //   <String, String>{'icon': Icons.more_horiz, 'text': 'More'},
    // ];
    const spacing = SizedBox(width: kHalfPadding * 1.1, height: kHalfPadding);


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            label: S.of(context).homeScreen_transactions_categoryTitle,
            icon: Icons.read_more_rounded,
            size: kMediumIconSize * 1.25,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          spacing,
          CategoryCard(
            label: S.of(context).homeScreen_billsResume_categoryTitle,
            icon: FontAwesomeIcons.fileInvoice,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          spacing,
          CategoryCard(
            label: S.of(context).homeScreen_salesStore_categoryTitle,
            icon: FontAwesomeIcons.shoppingBag,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),

          spacing,
          CategoryCard(
            label: S.of(context).homeScreen_supportChat_categoryTitle,
            icon: FontAwesomeIcons.solidCommentDots,
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
      splashColor: Theme.of(context).colorScheme.secondary,
      //focusColor: Colors.transparent,
      //highlightColor: Colors.transparent,
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
                      color: kGrayColor,
                      borderRadius:
                          BorderRadius.circular(kDefaultBorderRadiusAsDouble),
                      boxShadow: [kBoxDownShadowSubtle]),
                  child: Icon(
                    icon,
                    color: Colors.black,
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
