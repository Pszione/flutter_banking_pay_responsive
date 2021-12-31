import 'package:flutter_banking_pay_responsive/layers/domain/card.dart';

abstract class AccountCardsRepository {
  //
  Future<List<CardModel>> getAll();
}
