import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
import 'package:flutter_banking_pay_responsive/screens/activityInsights/activity_insights_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant_text_styles.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionCard({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kHalfPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!)),
      child: InkWell(
        // TODO: use sliding modal
        borderRadius: kDefaultBorderRadius,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ActivityInsightsScreen()),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(kHalfPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: transaction.color,
                  ),
                  child: transaction.avatar != null
                      ? Image.asset(transaction.avatar!)
                      : const Icon(
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
                      style: AppTextStyle.kListTileTitle,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      '${transaction.month}',
                      style: AppTextStyle.kListTileSubtitle,
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
                      transaction.price! == transaction.price!.roundToDouble()
                          ? '\$${transaction.price!.round()}'
                          : '\$${transaction.price!}',
                      style: AppTextStyle.kListTileTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
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
                          style: AppTextStyle.kListTileSubtitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
