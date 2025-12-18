import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/models/response/response.dart';

class DetailTripState {
  DetailCoachPaneTripData? detailCoachPaneTrip;
  bool isLoadingTrips = false;
  String? tripError;

  /// 1: huỷ vé
  /// 2: Lấy id thành công
  /// 3: Huỷ dữ chỗ
  int statusApp;

  String? idLichXeLimousineMoi;

  int gheTrong;

  DetailTripState({
    this.detailCoachPaneTrip,
    this.isLoadingTrips = false,
    this.tripError,
    this.statusApp = 0,
    this.idLichXeLimousineMoi,
    this.gheTrong = 0,
  });

  // Using a sentinel lets us differentiate between "keep existing value" and
  // "explicitly set to null", so passing tripError: null will now clear errors.
  DetailTripState copyWith({
    DetailCoachPaneTripData? detailCoachPaneTrip,
    bool? isLoadingTrips,
    Object? tripError = _sentinel,
    int? statusApp,
    String? idLichXeLimousineMoi,
    int? gheTrong,
  }) {
    return DetailTripState(
      detailCoachPaneTrip: detailCoachPaneTrip ?? this.detailCoachPaneTrip,
      isLoadingTrips: isLoadingTrips ?? this.isLoadingTrips,
      tripError: tripError == _sentinel ? this.tripError : tripError as String?,
      statusApp: statusApp ?? this.statusApp,
      idLichXeLimousineMoi: idLichXeLimousineMoi ?? this.idLichXeLimousineMoi,
      gheTrong: gheTrong ?? this.gheTrong,
    );
  }

  static const Object _sentinel = Object();
}
