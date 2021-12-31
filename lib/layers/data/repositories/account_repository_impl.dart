import 'package:flutter_banking_pay_responsive/layers/domain/account.dart';
import 'package:flutter_banking_pay_responsive/layers/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  @override
  // TODO: implement current
  AccountModel? get current => throw UnimplementedError();

  @override
  // TODO: implement allLoggedInAccounts
  List<AccountModel> get allLoggedInAccounts => throw UnimplementedError();

  @override
  Future<AccountModel> getAccount(String id) {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  @override
  Future<List<AccountModel>> getAllLoggedInAccounts() {
    // TODO: implement getAllLoggedInAccounts
    throw UnimplementedError();
  }
}
