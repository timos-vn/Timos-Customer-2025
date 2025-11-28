import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/services/trip_service.dart';
import 'detail_trip_event.dart';
import 'detail_trip_state.dart';

class DetailTripBloc extends Bloc<DetailTripEvent, DetailTripState> {
  final TripService _tripService;
  DetailTripBloc({
    TripService? tripService,
  })  : _tripService = tripService ?? TripService(),
        super(DetailTripState()) {
    on<LoadDetailCoachPaneTripEvent>(_onLoadDetailCoachPaneTrip);
    on<CancelTripEvent>(cancelTrip);
  }

  // Load detail coach pane trip from API
  Future<void> _onLoadDetailCoachPaneTrip(
    LoadDetailCoachPaneTripEvent event,
    Emitter<DetailTripState> emit,
  ) async {
    emit(state.copyWith(isLoadingTrips: true, tripError: null));

    try {
      final response = await _tripService.getDetailCoachTrip(
        idLichXeLimousine: event.idLichXeLimousine,
      );
      if (response.data != null) {
        emit(state.copyWith(
          detailCoachPaneTrip: response.data!,
          isLoadingTrips: false,
        ));
      } else {
        emit(state.copyWith(
          tripError: response.message ?? 'Không thể tải thông tin chuyến đi',
          isLoadingTrips: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        tripError: 'Lỗi khi tải thông tin chuyến đi: $e',
        isLoadingTrips: false,
      ));
    }
  }

  Future<void> cancelTrip(CancelTripEvent event, Emitter emit) async {
    emit(state.copyWith(isLoadingTrips: true, tripError: null));

    try {
      final response = await _tripService.cancelTicket(
        cancelTicketRequest: event.cancelTicketRequest,
      );

      if (response.data == true) {
        // Success - set flag để listener reload
        emit(state.copyWith(isLoadingTrips: false, isCancelSuccess: true));
      } else {
        // Lỗi - giữ nguyên data cũ, chỉ set error để hiển thị toast
        emit(state.copyWith(
          isLoadingTrips: false,
          tripError: response.message ?? "Huỷ vé thất bại",
          // Giữ nguyên detailCoachPaneTrip để không hiển thị màn hình trắng
        ));
      }

    } catch (e) {
      // Lỗi - giữ nguyên data cũ, chỉ set error để hiển thị toast
      emit(state.copyWith(
        tripError: 'Lỗi khi huỷ vé: $e',
        isLoadingTrips: false,
        // Giữ nguyên detailCoachPaneTrip để không hiển thị màn hình trắng
      ));
    }
  }
}
