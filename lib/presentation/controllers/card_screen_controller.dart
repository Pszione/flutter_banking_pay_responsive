import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/layers/domain/card.dart';

class CardScreenController {
  List<CardModel> cards = [];

  CardScreenController() {
    cards = myCards;
  }

  Color getCardColorNullSafety(CardModel card, {double opacity = 1.0}) =>
      CardModel.getCardColorNullSafety(card: card, opacity: opacity);
}
