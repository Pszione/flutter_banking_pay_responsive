import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({Key? key, required this.desiredPadding}) : super(key: key);

  final EdgeInsets desiredPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).hoverColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: desiredPadding.left, top: desiredPadding.top / 2),
            child: Semantics(
              child: Text(
                'News', // S.of(context).
                style: AppTextStyles.kMenuTitle(context),
              ),
              header: true,
            ),
          ),
          SizedBox(
            height: 230,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: kHugePadding);
              },
              itemCount: 2,
              itemBuilder: (context, index) {
                return buildNewsCard(context);
              },
              padding: EdgeInsets.only(
                left: !WebProvider.isWebPlatform ? desiredPadding.left : 0,
                right: !WebProvider.isWebPlatform ? desiredPadding.right : 0,
                top: desiredPadding.top / 2,
                bottom: desiredPadding.top,
              ),
            ),
          ),
          const SizedBox(height: kHalfPadding),
        ],
      ),
    );
  }

  Widget buildNewsCard(BuildContext context) {
    return Container(
      // onPress: () {}
      width: 250,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: kDefaultBorderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding,
            right: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(height: kHalfPadding),
            Text(
              'More credit limit available',
              style: AppTextStyles.kListTileTitle.copyWith(fontSize: 17),
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
            ),
            Text(
              'You bank just offered more pre-approved credit card limit.\nCome check it out and Enjoy!',
              style: AppTextStyles.kListTileSubtitle.copyWith(fontSize: 14),
              maxLines: 5,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => {},
                // AppSnackBarErrors.showSnackBarFeatureUnavailable(context),
                child: Text(
                  'See more',
                  textAlign: TextAlign.left,
                  style: TextStyle(
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
