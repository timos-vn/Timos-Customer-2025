
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/district_group_model.dart';

class DistrictModel {
  DistrictModel({
     this.requestId,
     this.communes,
  });

  final String? requestId;
  final List<Commune>? communes;

  factory DistrictModel.fromJson(Map<String, dynamic> json){
    return DistrictModel(
      requestId: json["requestId"] ?? "",
      communes: json["communes"] == null ? [] : List<Commune>.from(json["communes"]!.map((x) => Commune.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "communes": communes?.map((x) => x.toJson()).toList(),
  };

}

class Commune {
  Commune({
    required this.code,
    required this.name,
    required this.englishName,
    required this.administrativeLevel,
    required this.districtCode,
    required this.districtName,
    required this.provinceCode,
    required this.provinceName,
    required this.decree,
  });

  final String code;
  final String name;
  final String englishName;
  final String administrativeLevel;
  final String districtCode;
  final String districtName;
  final String provinceCode;
  final String provinceName;
  final String decree;

  factory Commune.fromJson(Map<String, dynamic> json){
    return Commune(
      code: json["code"] ?? "",
      name: json["name"] ?? "",
      englishName: json["englishName"] ?? "",
      administrativeLevel: json["administrativeLevel"] ?? "",
      districtCode: json["districtCode"] ?? "",
      districtName: json["districtName"] ?? "",
      provinceCode: json["provinceCode"] ?? "",
      provinceName: json["provinceName"] ?? "",
      decree: json["decree"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "englishName": englishName,
    "administrativeLevel": administrativeLevel,
    "districtCode": districtCode,
    "districtName": districtName,
    "provinceCode": provinceCode,
    "provinceName": provinceName,
    "decree": decree,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Commune && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;

}

extension DistrictModelExtension on DistrictModel {
  List<DistrictGroupModel> groupByDistrictCode() {
    final Map<String, DistrictGroupModel> map = {};

    if (communes != null) {
      for (var c in communes!) {
        if (!map.containsKey(c.districtCode)) {
          map[c.districtCode] = DistrictGroupModel(
            districtCode: c.districtCode,
            districtName: c.districtName,
            communes: [],
          );
        }
        map[c.districtCode]!.communes.add(c);
      }
    }

    return map.values.toList();
  }
}
