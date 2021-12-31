import 'package:flutter_banking_pay_responsive/layers/domain/account.dart';

abstract class AccountRepository {
  AccountModel? get current;
  List<AccountModel> get allLoggedInAccounts;
  //
  Future<AccountModel> getAccount(String id);
  Future<List<AccountModel>> getAllLoggedInAccounts();
}
