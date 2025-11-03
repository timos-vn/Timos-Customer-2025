import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_trip_event.freezed.dart';

@freezed
class DetailTripEvent with _$DetailTripEvent {
  const factory DetailTripEvent.loadDetailCoachPaneTrip({
    required String idLichXeLimousine,
  }) = LoadDetailCoachPaneTripEvent;
}
