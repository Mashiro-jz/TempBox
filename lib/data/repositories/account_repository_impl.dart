// lib/data/repositories/account_repository_impl.dart
import 'package:mailtm_client/mailtm_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  static const _tokenKey = "mailtm_token";
  AuthenticatedUser? _currentUser;

  AccountEntity _mapToEntity(AuthenticatedUser user) {
    return AccountEntity(
      id: user.account.id,
      address: user.account.address,
      quota: user.account.quota,
      used: user.account.used,
      isDisabled: user.account.isDisabled,
      isDeleted: user.account.isDeleted,
    );
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<AccountEntity> createAccount({
    required String password,
    String? username,
    String? domain,
  }) async {
    final user = await MailTm.register(username: username, password: password);

    _currentUser = user;
    await _saveToken(user.token);

    return _mapToEntity(user);
  }

  @override
  Future<AccountEntity> login({
    String? username,
    required String password,
  }) async {
    final user = await MailTm.login(address: username, password: password);

    _currentUser = user;
    await _saveToken(user!.token);

    return _mapToEntity(user);
  }

  @override
  Future<List<Domain>> getAvailableDomains() async {
    return await MailTm.domains();
  }

  @override
  Future<void> deleteAccount(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");

    await _currentUser!.delete();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);

    _currentUser = null;
  }

  @override
  Future<AccountEntity> updateAccount(AccountEntity account) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  // Pobierz wszystkie wiadomości jako Stream
  Future<Stream<List<Message>>> getMessages() async {
    if (_currentUser == null) throw Exception("User not authenticated");

    return _currentUser!.allMessages();
  }

  // Pobierz pojedynczą wiadomość po ID
  Future<Message> getMessageById(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");

    return await _currentUser!.messageFrom(id);
  }

  // Usuń wiadomość po ID
  Future<void> deleteMessage(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");

    await _currentUser!.deleteMessage(id);
  }

  // Oznacz wiadomość jako przeczytaną
  Future<void> markMessageAsRead(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");

    await _currentUser!.readMessage(id);
  }

  // Oznacz wiadomość jako nieprzeczytaną
  Future<void> markMessageAsUnread(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");

    await _currentUser!.unreadMessage(id);
  }
}
