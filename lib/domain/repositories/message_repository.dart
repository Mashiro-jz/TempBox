// lib\domain\repositories\message_repository.dart
import '../entities/message_entity.dart';

abstract class MessageRepository {
  Stream<List<MessageEntity>> allMessages();

  Future<MessageEntity> messageFrom(String id);

  Future<bool> readMessage(String id);

  Future<bool> unreadMessage(String id);

  Future<bool> deleteMessage(String id);
}
