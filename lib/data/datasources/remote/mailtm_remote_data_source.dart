// lib/data/datasources/remote/mailtm_remote_data_source.dart
import 'package:mailtm_client/mailtm_client.dart';

class MailTmRemoteDataSource {
  /// Logowanie do konta MailTM
  Future<AuthenticatedUser?> login({
    required String address,
    required String password,
  }) async {
    return await MailTm.login(address: address, password: password);
  }

  /// Rejestracja konta
  Future<AuthenticatedUser> createAccount({
    String? username,
    required String password,
  }) async {
    return await MailTm.register(username: username, password: password);
  }

  /// Pobranie listy domen
  Future<List<Domain>> getDomains() async {
    return await MailTm.domains();
  }

  /// Pobranie strumienia wszystkich wiadomości dla zalogowanego użytkownika
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
