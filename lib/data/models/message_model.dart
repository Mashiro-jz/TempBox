// lib\data\models\message_model.dart
import 'package:flutter/foundation.dart';
import 'package:mailtm_client/mailtm_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/message_entity.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const factory MessageModel({
    required String id,
    required String accountId,
    required String msgid,
    @Default('') String intro,
    required Map<String, String> from,
    required List<Map<String, String>> to,
    @Default([]) List<String> cc,
    @Default([]) List<String> bcc,
    @Default('') String subject,
    required bool seen,
    @Default(false) bool flagged,
    required bool isDeleted,
    @Default({}) Map<String, dynamic> verifications,
    @Default(false) bool retention,
    DateTime? retentionDate,
    @Default('') String text,
    @Default([]) List<String> html,
    required bool hasAttachments,
    @Default([]) List<Attachment> attachments,
    required int size,
    required String downloadUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  factory MessageModel.fromMessage(Message message) {
    return MessageModel(
      id: message.id,
      accountId: message.accountId,
      msgid: message.msgid,
      intro: message.intro,
      from: message.from,
      to: message.to,
      cc: message.cc,
      bcc: message.bcc,
      subject: message.subject,
      seen: message.seen,
      flagged: message.flagged,
      isDeleted: message.isDeleted,
      verifications: message.verifications,
      retention: message.retention,
      retentionDate: message.retentionDate,
      text: message.text,
      html: message.html,
      hasAttachments: message.hasAttachments,
      attachments: message.attachments,
      size: message.size,
      downloadUrl: message.downloadUrl,
      createdAt: message.createdAt,
      updatedAt: message.updatedAt,
    );
  }
}

extension MessageModelX on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(
      id: id,
      msgid: msgid,
      intro: intro,
      from: Map<String, String>.from(from),
      subject: subject,
      seen: seen,
      flagged: flagged,
      isDeleted: isDeleted,
      verifications: Map<String, dynamic>.from(verifications),
      retention: retention,
      retentionDate: retentionDate ?? DateTime.now(),
      text: text,
      html: List<String>.from(html),
      hasAttachments: hasAttachments,
      attachments: List<Attachment>.from(attachments),
      size: size,
      createdAt: createdAt,
    );
  }
}
