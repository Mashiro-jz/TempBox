// lib/presentation/providers/message_repository_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temp_box/presentation/providers/auth_provider.dart';
import '../../data/repositories/message_repository_impl.dart';
import '../../data/datasources/message/message_remote_data_source.dart';

final messageRepositoryProvider = Provider<MessageRepositoryImpl>((ref) {
  final accountRepo = ref.watch(accountRepositoryProvider);
  final currentUser = accountRepo.currentUser;

  if (currentUser == null) {
    throw Exception(
      "Nie można utworzyć MessageRepository – brak zalogowanego użytkownika",
    );
  }

  return MessageRepositoryImpl(
    messageRemoteDataSource: MessageRemoteDataSource(),
    currentUser: currentUser,
  );
});
