import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/models/response/response.dart';

class DetailTripState {
  DetailCoachPaneTripData? detailCoachPaneTrip;
  bool isLoadingTrips = false;
  String? tripError;

  /// 1: huỷ vé
  /// 2: Lấy id thành công
  /// 3: Lâ
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

  DetailTripState copyWith({
    DetailCoachPaneTripData? detailCoachPaneTrip,
    bool? isLoadingTrips,
    String? tripError,
    int? statusApp,
    String? idLichXeLimousineMoi,
    int? gheTrong,
  }) {
    return DetailTripState(
      detailCoachPaneTrip: detailCoachPaneTrip ?? this.detailCoachPaneTrip,
      isLoadingTrips: isLoadingTrips ?? this.isLoadingTrips,
      tripError: tripError ?? this.tripError,
        statusApp: statusApp ?? this.statusApp,
      idLichXeLimousineMoi: idLichXeLimousineMoi ?? this.idLichXeLimousineMoi,
      gheTrong: gheTrong ?? this.gheTrong,
    );
  }
}
