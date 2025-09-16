// lib\domain\entities\account_entity.dart

class AccountEntity {
  final String id;
  final String address;
  final int quota; // maximum mailbox capacity
  final int used; // used mailbox capacity
  final bool isDisabled;
  final bool isDeleted;

  AccountEntity({
    required this.id,
    required this.address,
    required this.quota,
    required this.used,
    required this.isDisabled,
    required this.isDeleted,
  });

  bool get isActive => !isDisabled && !isDeleted;
  int get remaining => quota - used; // remaining capacity
}
