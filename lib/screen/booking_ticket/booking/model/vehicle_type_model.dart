class VehicleTypeModel {
  VehicleTypeModel({
    required this.data,
    required this.paging,
    required this.statusCode,
    required this.message,
  });

  final List<DatumVehicle> data;
  final Paging? paging;
  final int statusCode;
  final String message;

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json){
    return VehicleTypeModel(
      data: json["data"] == null ? [] : List<DatumVehicle>.from(json["data"]!.map((x) => DatumVehicle.fromJson(x))),
      paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((x) => x?.toJson()).toList(),
    "paging": paging?.toJson(),
    "statusCode": statusCode,
    "message": message,
  };

}

class DatumVehicle {
  DatumVehicle({
    required this.id,
    required this.tenLoai,
    required this.soGhe,
  });

  final int id;
  final String tenLoai;
  final int soGhe;

  factory DatumVehicle.fromJson(Map<String, dynamic> json){
    return DatumVehicle(
      id: json["id"] ?? 0,
      tenLoai: json["tenLoai"] ?? "",
      soGhe: json["soGhe"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "tenLoai": tenLoai,
    "soGhe": soGhe,
  };

}

class Paging {
  Paging({
    required this.pageIndex,
    required this.pageSize,
    required this.totalRecords,
    required this.totalPage,
  });

  final int pageIndex;
  final int pageSize;
  final int totalRecords;
  final int totalPage;

  factory Paging.fromJson(Map<String, dynamic> json){
    return Paging(
      pageIndex: json["pageIndex"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      totalRecords: json["totalRecords"] ?? 0,
      totalPage: json["totalPage"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "pageIndex": pageIndex,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "totalPage": totalPage,
  };

}
