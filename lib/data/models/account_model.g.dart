// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      id: json['id'] as String,
      address: json['address'] as String,
      quota: (json['quota'] as num).toInt(),
      used: (json['used'] as num).toInt(),
      isDisabled: json['isDisabled'] as bool,
      isDeleted: json['isDeleted'] as bool,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'quota': instance.quota,
      'used': instance.used,
      'isDisabled': instance.isDisabled,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
