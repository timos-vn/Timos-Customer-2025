import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_pane_trip_request.freezed.dart';
part 'coach_pane_trip_request.g.dart';

@freezed
class CoachPaneTripRequest with _$CoachPaneTripRequest {
  const factory CoachPaneTripRequest({
    required int idNhaXe,
    required int idLoaiNhaXe,
    String? idNhanVien, // Optional: không truyền nếu chucVu = 5 hoặc 6
    required String ngayBatDau,
    required String ngayKetThuc,
    required int pageIndex,
    required int pageSize,
  }) = _CoachPaneTripRequest;

  factory CoachPaneTripRequest.fromJson(Map<String, dynamic> json) =>
      _$CoachPaneTripRequestFromJson(json);
}
