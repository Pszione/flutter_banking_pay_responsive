import 'package:flutter/material.dart';
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

    const spacing = SizedBox(width: kHalfPadding * 1.2, height: kHalfPadding);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            label: 'Transactions',
            icon: Icons.read_more_rounded,
            size: kMediumIconSize * 1.25,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          spacing,
          CategoryCard(
            label: 'Bills Resume',
            icon: FontAwesomeIcons.fileInvoice,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          spacing,
          CategoryCard(
            label: 'Sales Store',
            icon: FontAwesomeIcons.shoppingBag,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),

          spacing,
          CategoryCard(
            label: 'Support Chat',
            icon: FontAwesomeIcons.solidCommentDots,
            onPress: () =>
                AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
          ),
          spacing,
          CategoryCard(
            label: 'more',
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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.secondary,
      //focusColor: Colors.transparent,
      //highlightColor: Colors.transparent,
      borderRadius: kHugeBorderRadius,
      radius: kInkWellMediumRadius / 1.5,
      onTap: onPress,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            AspectRatio(
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
            const SizedBox(height: 5),
            Text(
              label,
              maxLines: 3, // for phones with increased font size
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: kTextMediumHeightSpacing * 0.9),
            )
          ],
        ),
      ),
    );
  }
}
