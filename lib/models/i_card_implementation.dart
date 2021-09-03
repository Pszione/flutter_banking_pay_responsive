import 'package:flutter/material.dart';

import 'card.dart';

abstract class ICardImplementation implements Widget {
  late CardModel card;
  late double width, height;
  late bool isClickable;
  late GestureTapCallback onPress;
}
