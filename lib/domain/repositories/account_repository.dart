// lib\domain\repositories\account_repository.dart

import 'package:mailtm_client/mailtm_client.dart';

import '../entities/account_entity.dart';

abstract class AccountRepository {
  Future<AccountEntity> createAccount({
    required String password,
    String? username,
    String? domain,
  });

  Future<AccountEntity> login({String? username, required String password});

  Future<List<Domain>> getAvailableDomains() async {
    return await MailTm.domains();
  }

  Future<AccountEntity> updateAccount(AccountEntity account);

  Future<void> deleteAccount(String id);
}
