// lib/presentation/providers/account_repository_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../data/datasources/account/account_remote_data_source.dart';
import '../../core/storage/key_value_storage.dart';

final accountRepositoryProvider = Provider<AccountRepositoryImpl>((ref) {
  return AccountRepositoryImpl(
    accountRemoteDataSource: AccountRemoteDataSource(),
    storage: SharedPrefsStorage(),
  );
});
