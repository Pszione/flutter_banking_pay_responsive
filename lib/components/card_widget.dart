import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.card}) : super(key: key);
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    // TODO: make it clickable and editable
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: card.cardColor ?? Colors.black,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CARD NAME",
                    style: AppTextStyle.kCardTitle,
                  ),
                  Text(
                    '${card.cardHolderName}',
                    style: AppTextStyle.kCardSubtitle,
                  ),
                ],
              ),
              Text(
                '${card.cardNumber}',
                style: AppTextStyle.kCardSubtitle,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EXP DATE",
                        style: AppTextStyle.kCardTitle,
                      ),
                      Text(
                        '${card.expDate}',
                        style: AppTextStyle.kCardSubtitle,
                      ),
                    ],
                  ),
                  const SizedBox(width: kDefaultPadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CVV NUMBER",
                        style: AppTextStyle.kCardTitle,
                      ),
                      Text(
                        '${card.cvv}',
                        style: AppTextStyle.kCardSubtitle,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                // TODO: get from enum of different brands
                child: Image.asset('assets/icons/logo_master_card.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
