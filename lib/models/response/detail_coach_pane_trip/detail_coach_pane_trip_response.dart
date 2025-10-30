import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_coach_pane_trip_response.freezed.dart';
part 'detail_coach_pane_trip_response.g.dart';

@freezed
class DetailCoachPaneTripResponse with _$DetailCoachPaneTripResponse {
  const factory DetailCoachPaneTripResponse({
    DetailCoachPaneTripData? data,
    @Default(0) int statusCode,
    String? message,
  }) = _DetailCoachPaneTripResponse;

  factory DetailCoachPaneTripResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailCoachPaneTripResponseFromJson(json);
}

@freezed
class DetailCoachPaneTripData with _$DetailCoachPaneTripData {
  const factory DetailCoachPaneTripData({
    @Default('') String idLichXeLimousine,
    @Default('') String maLimo,
    @Default('') String bienSoXe,
    String? ngayChay,
    String? gioDi,
    @Default('') String tenTaiXe,
    @Default('') String soDienThoaiTaiXe,
    @Default(0) int soGheDaDat,
    @Default(0) int tongSoGhe,
    @Default(0.0) double tongDoanhThu,
    @Default(0) int soGheDaDatCount,
    @Default(0) int soGheGiuChoCount,
    @Default(0) int soGheTrongCount,
    @Default([]) List<DetailTangItem> danhSachTang,
    DetailTangItem? tangHienTai,
  }) = _DetailCoachPaneTripData;

  factory DetailCoachPaneTripData.fromJson(Map<String, dynamic> json) =>
      _$DetailCoachPaneTripDataFromJson(json);
}

@freezed
class DetailTangItem with _$DetailTangItem {
  const factory DetailTangItem({
    @Default(0) int tang,
    @Default(0) int soGheDaDat,
    @Default(0) int soGheGiuCho,
    @Default(0) int soGheTrong,
    @Default([]) List<DetailGheItem> danhSachGhe,
  }) = _DetailTangItem;

  factory DetailTangItem.fromJson(Map<String, dynamic> json) =>
      _$DetailTangItemFromJson(json);
}

@freezed
class DetailGheItem with _$DetailGheItem {
  const factory DetailGheItem({
    @Default(0) int idGhe,
    @Default('') String tenGhe,
    @Default(0) int tang,
    @Default(0) int day,
    @Default(0) int hang,
    @Default(0) int trangThaiGhe,
    @Default('') String tenTrangThaiGhe,
    @Default(0.0) double giaVe,
    @Default('') String mauSac,
  }) = _DetailGheItem;

  factory DetailGheItem.fromJson(Map<String, dynamic> json) =>
      _$DetailGheItemFromJson(json);
}
