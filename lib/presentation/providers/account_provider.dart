// lib/presentation/providers/account_provider.dart
import 'package:flutter_riverpod/legacy.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../domain/entities/account_entity.dart';
import 'auth_provider.dart';

class AccountNotifier extends StateNotifier<AccountEntity?> {
  final AccountRepositoryImpl _repository;

  AccountNotifier(this._repository) : super(null);

  Future<void> createAccount(
    String password,
    String username,
    String domain,
  ) async {
    try {
      final account = await _repository.createAccount(
        username: username,
        password: password,
        domain: domain,
      );
      state = account;
    } catch (e) {
      throw Exception("Failed to create account: ${e.toString()}");
    }
  }

  Future<void> login(String address, String password) async {
    try {
      final account = await _repository.login(
        address: address,
        password: password,
      );
      state = account;
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<void> logout() async {
    if (state == null) return;
    try {
      await _repository.deleteAccount(state!.id);
      state = null;
    } catch (e) {
      throw Exception("Logout failed: ${e.toString()}");
    }
  }
}

final accountProvider = StateNotifierProvider<AccountNotifier, AccountEntity?>((
  ref,
) {
  final repo = ref.watch(accountRepositoryProvider) as AccountRepositoryImpl;
  return AccountNotifier(repo);
});
