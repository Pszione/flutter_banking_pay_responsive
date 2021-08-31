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
  });

  String? cardHolderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  CardBrand cardBrand;
  Color? cardColor;
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  1234",
    cvv: "**5",
    expDate: "12/21",
    cardColor: kPrimaryColor,
    cardBrand: CardBrand.mastercard,
  ),
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  5678",
    cvv: "**9",
    expDate: "01/22",
    cardBrand: CardBrand.visaPlatinum,
    cardColor: kSecondaryColor,
  ),
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  1170",
    cvv: "**0",
    expDate: "12/20",
    cardBrand: CardBrand.americanExpress,
    // cardColor: kSecondaryColor,
  ),
];
