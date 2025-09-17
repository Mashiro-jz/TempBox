// lib/data/models/account_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/account_entity.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String id,
    required String address,
    required int quota,
    required int used,
    required bool isDisabled,
    required bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}

extension AccountModelX on AccountModel {
  AccountEntity toEntity() {
    return AccountEntity(
      id: id,
      address: address,
      quota: quota,
      used: used,
      isDisabled: isDisabled,
      isDeleted: isDeleted,
    );
  }
}
