import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/models/response/response.dart';

part 'detail_trip_state.freezed.dart';

@freezed
class DetailTripState with _$DetailTripState {
  const factory DetailTripState({
    DetailCoachPaneTripData? detailCoachPaneTrip,
    @Default(false) bool isLoadingTrips,
    String? tripError,
  }) = _DetailTripState;

  factory DetailTripState.initial() => const DetailTripState();
}
