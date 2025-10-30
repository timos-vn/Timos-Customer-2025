import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_pane_trip_request.freezed.dart';
part 'coach_pane_trip_request.g.dart';

@freezed
class CoachPaneTripRequest with _$CoachPaneTripRequest {
  const factory CoachPaneTripRequest({
    required int idNhaXe,
    required int idLoaiNhaXe,
    required String idNhanVien,
    required String ngayBatDau,
    required String ngayKetThuc,
    required int pageIndex,
    required int pageSize,
  }) = _CoachPaneTripRequest;

  factory CoachPaneTripRequest.fromJson(Map<String, dynamic> json) =>
      _$CoachPaneTripRequestFromJson(json);
}
