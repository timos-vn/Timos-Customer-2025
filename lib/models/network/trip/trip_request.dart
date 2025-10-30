import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_request.freezed.dart';
part 'trip_request.g.dart';

@freezed
class TripListRequest with _$TripListRequest {
  const factory TripListRequest({
    required int pageIndex,
    required int pageSize,
    String? tuKhoa,
    required String ngayChay,
    required String idNhanVien,
    required int idNhom,
    String? idDoiTac,
  }) = _TripListRequest;

  factory TripListRequest.fromJson(Map<String, dynamic> json) =>
      _$TripListRequestFromJson(json);
}
