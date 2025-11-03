import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_coach_pane_trip_request.freezed.dart';
part 'detail_coach_pane_trip_request.g.dart';

@freezed
class DetailCoachPaneTripRequest with _$DetailCoachPaneTripRequest {
  const factory DetailCoachPaneTripRequest({
    required String idLichXeLimousine,
  }) = _DetailCoachPaneTripRequest;

  factory DetailCoachPaneTripRequest.fromJson(Map<String, dynamic> json) =>
      _$DetailCoachPaneTripRequestFromJson(json);
}
       