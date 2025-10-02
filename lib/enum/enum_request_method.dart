class EnumRequestMethod {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
}

enum UserRole { manager, dispatcher }

class TripSummary {
  final String tripId;
  final String routeName;
  final DateTime departureTime;
  final int bookedSeats;
  final int totalSeats;
  final String licensePlate;
  final String driverName;
  final String driverPhone;

  const TripSummary({
    required this.tripId,
    required this.routeName,
    required this.departureTime,
    required this.bookedSeats,
    required this.totalSeats,
    required this.licensePlate,
    required this.driverName,
    required this.driverPhone,
  });
}

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
