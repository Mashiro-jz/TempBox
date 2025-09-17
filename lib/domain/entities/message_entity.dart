// lib/domain/entities/message_entity.dart
import 'package:mailtm_client/mailtm_client.dart';

class MessageEntity {
  final String id;
  final String msgid;
  final String intro;
  final Map<String, String> from;
  final String subject;
  final bool seen;
  final bool flagged;
  final bool isDeleted;
  final Map<String, dynamic> verifications;
  final bool retention;
  final DateTime retentionDate;
  final String text;
  final List<String> html;
  final bool hasAttachments;
  final List<Attachment> attachments; // filename, contentType, size, url
  final int size;
  final DateTime createdAt;

  MessageEntity({
    required this.id,
    required this.msgid,
    required this.intro,
    required this.from,
    required this.subject,
    required this.seen,
    required this.flagged,
    required this.isDeleted,
    required this.verifications,
    required this.retention,
    required this.retentionDate,
    required this.text,
    required this.html,
    required this.hasAttachments,
    required this.attachments,
    required this.size,
    required this.createdAt,
  });

  DateTime? get remainingTime =>
      retention ? createdAt.subtract(retentionDate as Duration) : null;
}
