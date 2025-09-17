// lib/presentation/providers/auth_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../../core/storage/key_value_storage.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/account_repository.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../data/datasources/account/account_remote_data_source.dart';

final keyValueStorageProvider = Provider<KeyValueStorage>(
  (ref) => SharedPrefsStorage(),
);

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  final storage = ref.watch(keyValueStorageProvider);
  return AccountRepositoryImpl(
    accountRemoteDataSource: AccountRemoteDataSource(),
    storage: storage,
  );
});

class AuthState {
  final bool isLoading;
  final AccountEntity? user;
  final String? error;

  const AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, AccountEntity? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AccountRepository _repository;
  final KeyValueStorage _storage;
  static const _tokenKey = "mailtm_token";

  AuthNotifier(this._repository, this._storage) : super(const AuthState());

  Future<void> register({
    required String password,
    String? username,
    String? domain,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final account = await _repository.createAccount(
        password: password,
        username: username,
        domain: domain,
      );
      if (account.token != null) {
        await _storage.write(_tokenKey, account.token!);
      }
      state = state.copyWith(isLoading: false, user: account);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> login({required String password, String? username}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final account = await _repository.login(
        password: password,
        username: username,
      );
      if (account.token != null) {
        await _storage.write(_tokenKey, account.token!);
      }
      state = state.copyWith(isLoading: false, user: account);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> logout() async {
    await _storage.delete(_tokenKey);
    state = const AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final repo = ref.watch(accountRepositoryProvider);
  final storage = ref.watch(keyValueStorageProvider);
  return AuthNotifier(repo, storage);
});
