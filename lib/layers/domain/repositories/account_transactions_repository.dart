import 'package:flutter_banking_pay_responsive/layers/domain/transaction.dart';

abstract class AccountTransactionsRepository {
  //
  Future<TransactionModel> getAllRecent();
}
