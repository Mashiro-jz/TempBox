// lib/data/repositories/account_repository_impl.dart
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/remote/mailtm_remote_data_source.dart';
import 'package:mailtm_client/mailtm_client.dart';

class AccountRepositoryImpl implements AccountRepository {
  final MailTmRemoteDataSource remoteDataSource;
  static const _tokenKey = "mailtm_token";
  AuthenticatedUser? _currentUser;

  AccountRepositoryImpl({required this.remoteDataSource});

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
    final user = await remoteDataSource.createAccount(
      username: username,
      password: password,
    );

    _currentUser = user;
    await _saveToken(user.token);

    return _mapToEntity(user);
  }

  @override
  Future<AccountEntity> login({
    String? username,
    required String password,
  }) async {
    final user = await remoteDataSource.login(
      address: username!,
      password: password,
    );

    _currentUser = user;
    await _saveToken(user!.token);

    return _mapToEntity(user);
  }

  @override
  Future<List<Domain>> getAvailableDomains() async {
    return await remoteDataSource.getDomains();
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
    // TODO: MailTM API nie wspiera update, więc zostawiamy na później
    throw UnimplementedError();
  }

  // Wiadomości
  Future<Stream<List<Message>>> getMessages() async {
    if (_currentUser == null) throw Exception("User not authenticated");
    return remoteDataSource.getMessages(_currentUser!);
  }

  Future<Message> getMessageById(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");
    return remoteDataSource.getMessageById(_currentUser!, id);
  }

  Future<void> deleteMessage(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");
    await remoteDataSource.deleteMessage(_currentUser!, id);
  }

  Future<void> markMessageAsRead(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");
    await remoteDataSource.markMessageAsRead(_currentUser!, id);
  }

  Future<void> markMessageAsUnread(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");
    await remoteDataSource.markMessageAsUnread(_currentUser!, id);
  }
}
