import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';

import 'card_brand.dart';

class CardModel {
  CardModel({
    this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    this.cardBrand = CardBrand.mastercard,
    this.cardColor,
    this.nickname,
  });

  String? cardHolderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  CardBrand cardBrand;
  Color? cardColor;
  String? nickname;
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  1234",
    cvv: "**5",
    expDate: "12/21",
    cardColor: kComplementaryColor,
    cardBrand: CardBrand.mastercard,
  ),
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  5678",
    cvv: "**9",
    expDate: "01/22",
    cardBrand: CardBrand.visaPlatinum,
    cardColor: kSecondaryColor,
    nickname: 'C6 Pink',
  ),
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  1170",
    cvv: "**0",
    expDate: "12/20",
    cardBrand: CardBrand.americanExpress,
    // cardColor: kSecondaryColor,
    nickname: 'Black Unlimited',
  ),
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  2552",
    cvv: "**5",
    expDate: "20/20",
    cardBrand: CardBrand.mastercard,
    cardColor: Colors.white,
  ),
];
