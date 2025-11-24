import 'package:timos_customer_2025/screen/booking_ticket/booking/model/district_model.dart';

class DistrictGroupModel {
  final String districtCode;
  final String districtName;
  final List<Commune> communes;

  DistrictGroupModel({
    required this.districtCode,
    required this.districtName,
    required this.communes,
  });
}
