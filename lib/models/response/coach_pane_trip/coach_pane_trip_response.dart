// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'coach_pane_trip_response.freezed.dart';
// part 'coach_pane_trip_response.g.dart';
//
// @freezed
// class CoachPaneTripResponse with _$CoachPaneTripResponse {
//   const factory CoachPaneTripResponse({
//     List<CoachPaneTripItem>? data,
//     @Default(0) int statusCode,
//     String? message,
//   }) = _CoachPaneTripResponse;
//
//   factory CoachPaneTripResponse.fromJson(Map<String, dynamic> json) =>
//       _$CoachPaneTripResponseFromJson(json);
// }
//
// extension CoachPaneTripResponseX on CoachPaneTripResponse {
//   bool get isSuccess => statusCode == 200 && data != null;
// }
//
// @freezed
// class CoachPaneTripItem with _$CoachPaneTripItem {
//   const factory CoachPaneTripItem({
//     @Default('') String id,
//     @Default(0) int idNhaXe,
//     @Default('') String tenNhaXe,
//     @Default(0) int idTuyenDuong,
//     @Default('') String tenTuyenDuong,
//     String? ngayChay,
//     String? gioDi,
//     @Default(0) int idLoaiXe,
//     @Default('') String tenLoaiXe,
//     @Default(0) int idXe,
//     @Default('') String bienSoXe,
//     String? idTaiXe,
//     @Default('') String tenTaiXe,
//     String? idPhuXe,
//     @Default('') String tenPhuXe,
//     @Default(0) int soGheDaDat,
//     @Default(0) int tongSoGhe,
//     @Default(0) int trangThai,
//     @Default('') String tenTrangThai,
//     String? ngayTao,
//     String? nguoiTao,
//   }) = _CoachPaneTripItem;
//
//   factory CoachPaneTripItem.fromJson(Map<String, dynamic> json) =>
//       _$CoachPaneTripItemFromJson(json);
// }


class CoachPaneTripResponse {
  CoachPaneTripResponse({
    required this.data,
    required this.pageIndex,
    required this.pageSize,
    required this.totalRecords,
    required this.pageCount,
    required this.statusCode,
    required this.message,
  });

  final List<CoachPaneTripItem> data;
  final int pageIndex;
  final int pageSize;
  final int totalRecords;
  final int pageCount;
  final int statusCode;
  final String message;

  factory CoachPaneTripResponse.fromJson(Map<String, dynamic> json){
    return CoachPaneTripResponse(
      data: json["data"] == null ? [] : List<CoachPaneTripItem>.from(json["data"]!.map((x) => CoachPaneTripItem.fromJson(x))),
      pageIndex: json["pageIndex"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      totalRecords: json["totalRecords"] ?? 0,
      pageCount: json["pageCount"] ?? 0,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((x) => x?.toJson()).toList(),
    "pageIndex": pageIndex,
    "pageSize": pageSize,
    "totalRecords": totalRecords,
    "pageCount": pageCount,
    "statusCode": statusCode,
    "message": message,
  };

}

class CoachPaneTripItem {
  CoachPaneTripItem({
    required this.id,
    required this.idNhaXe,
    required this.tenNhaXe,
    required this.idTuyenDuong,
    required this.tenTuyenDuong,
    required this.ngayChay,
    required this.gioDi,
    required this.idLoaiXe,
    required this.tenLoaiXe,
    required this.idXe,
    required this.bienSoXe,
    required this.idTaiXe,
    required this.tenTaiXe,
    required this.idPhuXe,
    required this.tenPhuXe,
    required this.soGheDaDat,
    required this.tongSoGhe,
    required this.trangThai,
    required this.tenTrangThai,
    required this.ngayTao,
    required this.nguoiTao,
    required this.idLichChayXe,
  });

  final String id;
  final int idNhaXe;
  final String tenNhaXe;
  final int idTuyenDuong;
  final String tenTuyenDuong;
  final DateTime? ngayChay;
  final String gioDi;
  final int idLoaiXe;
  final String tenLoaiXe;
  final int idXe;
  final String bienSoXe;
  final String idTaiXe;
  final String tenTaiXe;
  final dynamic idPhuXe;
  final String tenPhuXe;
  final int soGheDaDat;
  final int tongSoGhe;
  final int trangThai;
  final String tenTrangThai;
  final DateTime? ngayTao;
  final dynamic nguoiTao;
  final int idLichChayXe;

  factory CoachPaneTripItem.fromJson(Map<String, dynamic> json){
    return CoachPaneTripItem(
      id: json["id"] ?? "",
      idNhaXe: json["idNhaXe"] ?? 0,
      tenNhaXe: json["tenNhaXe"] ?? "",
      idTuyenDuong: json["idTuyenDuong"] ?? 0,
      tenTuyenDuong: json["tenTuyenDuong"] ?? "",
      ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
      gioDi: json["gioDi"] ?? "",
      idLoaiXe: json["idLoaiXe"] ?? 0,
      tenLoaiXe: json["tenLoaiXe"] ?? "",
      idXe: json["idXe"] ?? 0,
      bienSoXe: json["bienSoXe"] ?? "",
      idTaiXe: json["idTaiXe"] ?? "",
      tenTaiXe: json["tenTaiXe"] ?? "",
      idPhuXe: json["idPhuXe"],
      tenPhuXe: json["tenPhuXe"] ?? "",
      soGheDaDat: json["soGheDaDat"] ?? 0,
      tongSoGhe: json["tongSoGhe"] ?? 0,
      trangThai: json["trangThai"] ?? 0,
      tenTrangThai: json["tenTrangThai"] ?? "",
      ngayTao: DateTime.tryParse(json["ngayTao"] ?? ""),
      nguoiTao: json["nguoiTao"],
      idLichChayXe: json["idLichChayXe"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "idNhaXe": idNhaXe,
    "tenNhaXe": tenNhaXe,
    "idTuyenDuong": idTuyenDuong,
    "tenTuyenDuong": tenTuyenDuong,
    "ngayChay": ngayChay?.toIso8601String(),
    "gioDi": gioDi,
    "idLoaiXe": idLoaiXe,
    "tenLoaiXe": tenLoaiXe,
    "idXe": idXe,
    "bienSoXe": bienSoXe,
    "idTaiXe": idTaiXe,
    "tenTaiXe": tenTaiXe,
    "idPhuXe": idPhuXe,
    "tenPhuXe": tenPhuXe,
    "soGheDaDat": soGheDaDat,
    "tongSoGhe": tongSoGhe,
    "trangThai": trangThai,
    "tenTrangThai": tenTrangThai,
    "ngayTao": ngayTao?.toIso8601String(),
    "nguoiTao": nguoiTao,
    "idLichChayXe": idLichChayXe,
  };

}
