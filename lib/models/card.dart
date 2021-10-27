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

  static Color getCardColorNullSafety(
      {required CardModel card, double opacity = 1.0}) {
    Color selectedColor = card.cardColor ?? Colors.black45;

    if (selectedColor == Colors.white) {
      // TODO: is it the right way to do it?
      return kGrayColor;
    } else {
      return selectedColor.withOpacity(opacity);
    }
  }

  static String? getCardNickname(CardModel card) {
    return card.nickname ?? card.cardNumber;
  }

  static bool hasCardExpired(String? expDate) {
    if (expDate == null || expDate.isEmpty) {
      return true; // warning
    } else if (expDate.contains('/')) {
      var currentYear = DateTime.now();
      var expMonth = expDate.split('/').first;
      var expYear = expDate.split('/').last;

      var cardDate = expYear.length <= 2
          ? DateTime(2000 + int.parse(expYear), int.parse(expMonth))
          : DateTime(int.parse(expYear), int.parse(expMonth));

      return cardDate.isBefore(currentYear);
    }
    return false;
  }

  static DateTime? parseExpDateStringToDateTime(String? expDate) {
    if (expDate == null || expDate.isEmpty) {
      return null;
    } else if (expDate.contains('/')) {
      var expMonth = expDate.split('/').first;
      var expYear = expDate.split('/').last;

      return expYear.length <= 2
          ? DateTime(2000 + int.parse(expYear), int.parse(expMonth))
          : DateTime(int.parse(expYear), int.parse(expMonth));
    }
  }
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
