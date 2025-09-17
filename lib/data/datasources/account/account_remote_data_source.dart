// lib\data\datasources\account\mailtm_remote_data_source.dart
import 'package:mailtm_client/mailtm_client.dart';

class AccountRemoteDataSource {
  /// Logowanie do konta MailTM
  Future<AuthenticatedUser?> login({
    required String address,
    required String password,
  }) async {
    return await MailTm.login(address: address, password: password);
  }

  /// Rejestracja konta
  Future<AuthenticatedUser> createAccount({
    String? username,
    required String password,
  }) async {
    return await MailTm.register(username: username, password: password);
  }

  /// Pobranie listy domen
  Future<List<Domain>> getDomains() async {
    return await MailTm.domains();
  }
}
