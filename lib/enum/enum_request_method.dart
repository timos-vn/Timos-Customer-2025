class EnumRequestMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
}

enum UserRole { manager, dispatcher }

class CustomerInfo {
  final String customerId;
  final String name;
  final String phone;
  final String note;

  const CustomerInfo({
    required this.customerId,
    required this.name,
    required this.phone,
    this.note = '',
  });
}
