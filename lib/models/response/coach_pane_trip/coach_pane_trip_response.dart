import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_pane_trip_response.freezed.dart';
part 'coach_pane_trip_response.g.dart';

@freezed
class CoachPaneTripResponse with _$CoachPaneTripResponse {
  const factory CoachPaneTripResponse({
    List<CoachPaneTripItem>? data,
    @Default(0) int statusCode,
    String? message,
  }) = _CoachPaneTripResponse;

  factory CoachPaneTripResponse.fromJson(Map<String, dynamic> json) =>
      _$CoachPaneTripResponseFromJson(json);
}

extension CoachPaneTripResponseX on CoachPaneTripResponse {
  bool get isSuccess => statusCode == 200 && data != null;
}

@freezed
class CoachPaneTripItem with _$CoachPaneTripItem {
  const factory CoachPaneTripItem({
    @Default('') String id,
    @Default(0) int idNhaXe,
    @Default('') String tenNhaXe,
    @Default(0) int idTuyenDuong,
    @Default('') String tenTuyenDuong,
    String? ngayChay,
    String? gioDi,
    @Default(0) int idLoaiXe,
    @Default('') String tenLoaiXe,
    @Default(0) int idXe,
    @Default('') String bienSoXe,
    String? idTaiXe,
    @Default('') String tenTaiXe,
    String? idPhuXe,
    @Default('') String tenPhuXe,
    @Default(0) int soGheDaDat,
    @Default(0) int tongSoGhe,
    @Default(0) int trangThai,
    @Default('') String tenTrangThai,
    String? ngayTao,
    String? nguoiTao,
  }) = _CoachPaneTripItem;

  factory CoachPaneTripItem.fromJson(Map<String, dynamic> json) =>
      _$CoachPaneTripItemFromJson(json);
}
