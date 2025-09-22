// lib\data\repositories\message_repository_impl.dart
import '../../domain/entities/message_entity.dart';
import '../../domain/repositories/message_repository.dart';
import '../datasources/message/message_remote_data_source.dart';
import '../models/message_model.dart';
import 'package:mailtm_client/mailtm_client.dart';

class MessageRepositoryImpl implements MessageRepository {
  final MessageRemoteDataSource messageRemoteDataSource;
  final AuthenticatedUser currentUser;

  MessageRepositoryImpl({
    required this.messageRemoteDataSource,
    required this.currentUser,
  });

  @override
  Stream<List<MessageEntity>> allMessages() {
    return messageRemoteDataSource
        .getMessages(currentUser)
        .map(
          (messages) => messages
              .map((m) => MessageModel.fromMessage(m).toEntity())
              .toList(),
        );
  }

  @override
  Future<bool> deleteMessage(String id) async {
    try {
      await messageRemoteDataSource.deleteMessage(currentUser, id);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<MessageEntity> messageFrom(String id) async {
    final message = await messageRemoteDataSource.getMessageById(
      currentUser,
      id,
    );
    return MessageModel.fromMessage(message).toEntity();
  }

  @override
  Future<bool> readMessage(String id) async {
    try {
      await messageRemoteDataSource.markMessageAsRead(currentUser, id);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> unreadMessage(String id) async {
    try {
      await messageRemoteDataSource.markMessageAsUnread(currentUser, id);
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<List<int>> downloadAttachment(String url) async {
    try {
      final bytes = await messageRemoteDataSource.downloadAttachment(
        currentUser,
        url,
      );
      return bytes;
    } catch (e) {
      rethrow;
    }
  }
}
