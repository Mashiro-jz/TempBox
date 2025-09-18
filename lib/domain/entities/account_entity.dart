// lib/domain/entities/account_entity.dart
class AccountEntity {
  final String id;
  final String address;
  final String password;
  final int quota;
  final int used;
  final bool isDisabled;
  final bool isDeleted;
  final String? token;

  AccountEntity({
    required this.id,
    required this.address,
    required this.password,
    required this.quota,
    required this.used,
    required this.isDisabled,
    required this.isDeleted,
    this.token,
  });

  bool get isActive => !isDisabled && !isDeleted;
  int get remaining => quota - used;
}
