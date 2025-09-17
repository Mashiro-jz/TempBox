// lib/data/repositories/account_repository_impl.dart
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../datasources/account/account_remote_data_source.dart';
import '../datasources/message/message_remote_data_source.dart';
import '../../core/storage/key_value_storage.dart';
import 'package:mailtm_client/mailtm_client.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDataSource accountRemoteDataSource;
  final MessageRemoteDataSource messageRemoteDataSource;
  final KeyValueStorage storage;

  static const _tokenKey = "mailtm_token";
  AuthenticatedUser? _currentUser;

  AccountRepositoryImpl({
    required this.accountRemoteDataSource,
    required this.messageRemoteDataSource,
    required this.storage,
  });

  AccountEntity _mapToEntity(AuthenticatedUser user) {
    return AccountEntity(
      id: user.account.id,
      address: user.account.address,
      quota: user.account.quota,
      used: user.account.used,
      isDisabled: user.account.isDisabled,
      isDeleted: user.account.isDeleted,
      token: user.token,
    );
  }

  Future<void> _saveToken(String token) async =>
      await storage.write(_tokenKey, token);

  Future<String?> getToken() async => storage.read(_tokenKey);

  @override
  Future<AccountEntity> createAccount({
    required String password,
    String? username,
    String? domain,
  }) async {
    final user = await accountRemoteDataSource.createAccount(
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
    final user = await accountRemoteDataSource.login(
      address: username!,
      password: password,
    );
    _currentUser = user;
    await _saveToken(user!.token);
    return _mapToEntity(user);
  }

  @override
  Future<void> deleteAccount(String id) async {
    if (_currentUser == null) throw Exception("User not authenticated");
    await _currentUser!.delete();
    await storage.delete(_tokenKey);
    _currentUser = null;
  }

  @override
  Future<String> getTokenFromUserId(String id) async {
    if (_currentUser != null && _currentUser!.account.id == id) {
      return _currentUser!.token;
    }
    final token = await storage.read(_tokenKey);
    if (token != null) return token;
    throw Exception("Token for user $id not found.");
  }

  @override
  Future<AccountEntity> updateAccount(AccountEntity account) {
    throw UnimplementedError();
  }

  @override
  Future<List<Domain>> getAvailableDomains() async {
    return await accountRemoteDataSource.getDomains();
  }
}
