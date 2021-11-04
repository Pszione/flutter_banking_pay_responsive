import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/extensions.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant_text_styles.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  final bool isClickable;
  final GestureTapCallback onPress;

  const TransactionCard(
      {Key? key,
      required this.transaction,
      this.isClickable = true,
      required this.onPress})
      : super(key: key);

  static Widget defaultDimensionColored = Container(
    width: double.infinity,
    height: 60 + kDefaultPadding,
    decoration: ShapeDecoration(
      color: const Color(0xFF000000),
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
        side: const BorderSide(width: 3),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
        //border: Border.all(width: 2, color: Colors.grey[300]!),
        side: BorderSide(width: 2, color: kLightGrayColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kHalfPadding),
        child: InkWell(
          borderRadius: kDefaultBorderRadius,
          splashColor: Theme.of(context).colorScheme.secondary,
          onTap: () => onPress.call(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(kHalfPadding),
                    decoration: BoxDecoration(
                      borderRadius: kDefaultBorderRadius,
                      color: transaction.color,
                    ),
                    child: transaction.avatar != null
                        ? Image.asset(transaction.avatar!)
                        : const Icon(
                            // TODO: initial letters
                            Icons.account_circle_rounded,
                            size: kHugeIconSize,
                            color: kTextGrayColor,
                          ),
                  ),
                  const SizedBox(width: kHalfPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${transaction.title}',
                        style: AppTextStyles.kListTileTitle,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                      Text(
                        '${transaction.month}',
                        style: AppTextStyles.kListTileSubtitle,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // '${transaction.currentBalance}',
                        //transaction.price! == transaction.price!.roundToDouble()
                        transaction.price!.hasFractional
                            ? '\$${transaction.price!}'
                            : '\$${transaction.price!.round()}',
                        style: AppTextStyles.kListTileTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ExcludeSemantics(
                        child: Row(
                          children: [
                            transaction.changePercentageIndicator == "up"
                                ? const Icon(
                                    FontAwesomeIcons.levelUpAlt,
                                    size: 10,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    FontAwesomeIcons.levelDownAlt,
                                    size: 10,
                                    color: Colors.red,
                                  ),
                            const SizedBox(width: kHalfPadding),
                            Text(
                              '${transaction.changePercentage}',
                              style: AppTextStyles.kListTileSubtitle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
