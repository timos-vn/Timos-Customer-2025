import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/models/response/response.dart';

class DetailTripState {
  DetailCoachPaneTripData? detailCoachPaneTrip;
  bool isLoadingTrips = false;
  String? tripError;

  DetailTripState({
    this.detailCoachPaneTrip,
    this.isLoadingTrips = false,
    this.tripError,
  });

  DetailTripState copyWith({
    DetailCoachPaneTripData? detailCoachPaneTrip,
    bool? isLoadingTrips,
    String? tripError,
  }) {
    return DetailTripState(
      detailCoachPaneTrip: detailCoachPaneTrip ?? this.detailCoachPaneTrip,
      isLoadingTrips: isLoadingTrips ?? this.isLoadingTrips,
      tripError: tripError ?? this.tripError,
    );
  }
}
