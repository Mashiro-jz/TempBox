// lib/presentation/providers/account_provider.dart
import 'package:flutter_riverpod/legacy.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../domain/entities/account_entity.dart';
import 'account_repository_provider.dart';

class AccountNotifier extends StateNotifier<AccountEntity?> {
  final AccountRepositoryImpl _repository;

  AccountNotifier(this._repository) : super(null);

  Future<void> createAccount(String password, {String? username}) async {
    final account = await _repository.createAccount(
      password: password,
      username: username,
    );
    state = account;
  }

  Future<void> login(String username, String password) async {
    final account = await _repository.login(
      username: username,
      password: password,
    );
    state = account;
  }

  Future<void> logout() async {
    if (state == null) return;
    await _repository.deleteAccount(state!.id);
    state = null;
  }
}

final accountProvider = StateNotifierProvider<AccountNotifier, AccountEntity?>((
  ref,
) {
  final repo = ref.watch(accountRepositoryProvider);
  return AccountNotifier(repo);
});
