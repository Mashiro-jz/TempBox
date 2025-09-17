// lib\data\datasources\message\message_remote_data_source.dart
import 'package:mailtm_client/mailtm_client.dart';

class MessageRemoteDataSource {
  /// Pobranie strumienia wszystkich wiadomości
  Future<Stream<List<Message>>> getMessages(AuthenticatedUser user) async {
    return user.allMessages();
  }

  /// Pobranie pojedynczej wiadomości po ID
  Future<Message> getMessageById(AuthenticatedUser user, String id) async {
    return await user.messageFrom(id);
  }

  /// Usunięcie wiadomości
  Future<void> deleteMessage(AuthenticatedUser user, String id) async {
    await user.deleteMessage(id);
  }

  /// Oznacz wiadomość jako przeczytaną
  Future<void> markMessageAsRead(AuthenticatedUser user, String id) async {
    await user.readMessage(id);
  }

  /// Oznacz wiadomość jako nieprzeczytaną
  Future<void> markMessageAsUnread(AuthenticatedUser user, String id) async {
    await user.unreadMessage(id);
  }
}
