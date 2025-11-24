import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/road_trip_event.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/road_trip_state.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';

class RoadTripBloc extends Bloc<RoadTripEvent, RoadTripState> {
  RoadTripBloc() : super(const RoadTripState()) {
    on<InitRoadTripEvent>((event, emit) {
      initRoadTrip(event, emit);
    });
  }

  void initRoadTrip(InitRoadTripEvent event, Emitter emit) {


    List<ThongTinTuyenDuongNhax> listTuyen = (event.typeTicketBusModel?.data?.thongTinTuyenDuongNhaxes ?? []).where((element) => element.idNhaXe == event.thongTinTuyenDuong?.idNhaXe).toList();

    emit(state.copyWith(
      typeTicketBusModel: event.typeTicketBusModel,
      listThongTinTuyenDuongNhax: listTuyen,
      thongTinTuyenDuong: event.thongTinTuyenDuong,
    ));
  }

}