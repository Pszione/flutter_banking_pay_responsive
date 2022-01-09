import '../../layers.dart';

abstract class AccountRepository {
  AccountModel? get current;
  List<AccountModel> get allLoggedInAccounts;
  //
  Future<AccountModel> getAccount(String id);
  Future<List<AccountModel>> getAllLoggedInAccounts();
}
