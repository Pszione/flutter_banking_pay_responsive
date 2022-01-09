import 'package:flutter/material.dart';

import '../../layers/layers.dart';

class CardScreenController {
  List<CardModel> cards = [];

  CardScreenController() {
    cards = myCards;
  }

  Color getCardColorNullSafety(CardModel card, {double opacity = 1.0}) =>
      CardModel.getCardColorNullSafety(card: card, opacity: opacity);
}
