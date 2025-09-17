// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String,
      accountId: json['accountId'] as String,
      msgid: json['msgid'] as String,
      intro: json['intro'] as String? ?? '',
      from: Map<String, String>.from(json['from'] as Map),
      to: (json['to'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
      cc:
          (json['cc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      bcc:
          (json['bcc'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      subject: json['subject'] as String? ?? '',
      seen: json['seen'] as bool,
      flagged: json['flagged'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool,
      verifications: json['verifications'] as Map<String, dynamic>? ?? const {},
      retention: json['retention'] as bool? ?? false,
      retentionDate: json['retentionDate'] == null
          ? null
          : DateTime.parse(json['retentionDate'] as String),
      text: json['text'] as String? ?? '',
      html:
          (json['html'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      hasAttachments: json['hasAttachments'] as bool,
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      size: (json['size'] as num).toInt(),
      downloadUrl: json['downloadUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'msgid': instance.msgid,
      'intro': instance.intro,
      'from': instance.from,
      'to': instance.to,
      'cc': instance.cc,
      'bcc': instance.bcc,
      'subject': instance.subject,
      'seen': instance.seen,
      'flagged': instance.flagged,
      'isDeleted': instance.isDeleted,
      'verifications': instance.verifications,
      'retention': instance.retention,
      'retentionDate': instance.retentionDate?.toIso8601String(),
      'text': instance.text,
      'html': instance.html,
      'hasAttachments': instance.hasAttachments,
      'attachments': instance.attachments,
      'size': instance.size,
      'downloadUrl': instance.downloadUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
