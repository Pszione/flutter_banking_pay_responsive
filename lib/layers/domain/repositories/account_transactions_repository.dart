import '../../layers.dart';

abstract class AccountTransactionsRepository {
  //
  Future<TransactionModel> getAllRecent();
}
