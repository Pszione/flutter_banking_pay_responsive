import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
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
                child:
                    Image.asset(transaction.avatar!), // ?? Icon(Icons.profile),
              ),
              const SizedBox(width: kHalfPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transaction.title}',
                    style: AppTextStyle.kListTileTitle,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transaction.currentBalance}',
                    style: AppTextStyle.kListTileTitle,
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
    );
  }
}
