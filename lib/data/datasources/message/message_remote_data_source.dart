// lib\data\datasources\message\message_remote_data_source.dart
import 'package:mailtm_client/mailtm_client.dart';

class MessageRemoteDataSource {
  Future<Stream<List<Message>>> getMessages(AuthenticatedUser user) async {
    return user.allMessages();
  }

  Future<Message> getMessageById(AuthenticatedUser user, String id) async {
    return await user.messageFrom(id);
  }

  Future<void> deleteMessage(AuthenticatedUser user, String id) async {
    await user.deleteMessage(id);
  }

  Future<void> markMessageAsRead(AuthenticatedUser user, String id) async {
    await user.readMessage(id);
  }

  Future<void> markMessageAsUnread(AuthenticatedUser user, String id) async {
    await user.unreadMessage(id);
  }
}
