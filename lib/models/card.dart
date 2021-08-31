import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';

class CardModel {
  CardModel({
    this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    this.cardColor,
  });

  String? cardHolderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  Color? cardColor;
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  1234",
    cvv: "**5",
    expDate: "12/21",
    cardColor: kPrimaryColor,
  ),
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  5678",
    cvv: "**9",
    expDate: "01/22",
    cardColor: kSecondaryColor,
  ),
  CardModel(
    cardHolderName: "Mr Pedro",
    cardNumber: "****  ****  ****  1170",
    cvv: "**0",
    expDate: "12/20",
    // cardColor: kSecondaryColor,
  ),
];
