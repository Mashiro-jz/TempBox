// lib/presentation/providers/message_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/message_entity.dart';
import 'message_repository_provider.dart';

final messagesProvider = StreamProvider<List<MessageEntity>>((ref) {
  final repo = ref.read(messageRepositoryProvider);
  return repo.allMessages();
});

final messageProvider = FutureProvider.family<MessageEntity, String>((
  ref,
  id,
) async {
  final repo = ref.read(messageRepositoryProvider);
  return repo.messageFrom(id);
});

final markMessageReadProvider = FutureProvider.family<bool, String>((
  ref,
  id,
) async {
  final repo = ref.read(messageRepositoryProvider);
  return repo.readMessage(id);
});

final markMessageUnreadProvider = FutureProvider.family<bool, String>((
  ref,
  id,
) async {
  final repo = ref.read(messageRepositoryProvider);
  return repo.unreadMessage(id);
});

final deleteMessageProvider = FutureProvider.family<bool, String>((
  ref,
  id,
) async {
  final repo = ref.read(messageRepositoryProvider);
  return repo.deleteMessage(id);
});

final downloadAttachmentProvider = FutureProvider.family<List<int>, String>((
  ref,
  url,
) async {
  final repo = ref.read(messageRepositoryProvider);
  return repo.downloadAttachment(url);
});
