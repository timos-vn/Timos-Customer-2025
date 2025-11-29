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
    on<IdTripEvent>(taoLichNhaXe);
    on<TinhSoGheTrong>(capNhatGheTrong);
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

        int gheTrong = 0;
        for(var tang in response.data!.danhSachTang[event.tang].danhSachGhe){
          gheTrong += tang.isGheAo ? 0 : (tang.trangThaiGhe == 1 ? 1 : 0);
        }

        emit(state.copyWith(
          detailCoachPaneTrip: response.data!,
          gheTrong: gheTrong,
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
        emit(state.copyWith(isLoadingTrips: false, statusApp: 1));
        // Reset effect state
        emit(state.copyWith(statusApp: 0));

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

  Future<void> taoLichNhaXe(IdTripEvent event, Emitter emit) async {
    emit(state.copyWith(isLoadingTrips: true, tripError: null));

    try {
      final response = await _tripService.layIdNhaXe(
        taoLichNhaXeRequest: event.taoLichNhaXeRequest,
      );

      if (response.statusCode == 200) {
        // Success effect
        emit(state.copyWith(isLoadingTrips: false, statusApp: 2, idLichXeLimousineMoi: response.data));

        // Reset effect state
        emit(state.copyWith(statusApp: 0));
      } else {
        emit(state.copyWith(
          isLoadingTrips: false,
          tripError: "Lấy id thất bại",
        ));
      }

    } catch (e) {
      emit(state.copyWith(
        tripError: 'Lỗi khi lấy id $e',
        isLoadingTrips: false,
      ));
    }
  }


  Future<void> capNhatGheTrong(TinhSoGheTrong event, Emitter emit) async {
    int gheTrong = 0;
    for(var tang in state.detailCoachPaneTrip!.danhSachTang[event.tang].danhSachGhe){
      gheTrong += tang.isGheAo ? 0 : (tang.trangThaiGhe == 1 ? 1 : 0);
    }

    emit(state.copyWith(
      gheTrong: gheTrong,
    ));
  }
}
