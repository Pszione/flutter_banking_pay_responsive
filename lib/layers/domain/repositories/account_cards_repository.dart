import '../../layers.dart';

abstract class AccountCardsRepository {
  //
  Future<List<CardModel>> getAll();
}
