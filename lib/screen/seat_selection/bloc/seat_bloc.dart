import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/seating_request_model.dart';
import 'package:timos_customer_2025/screen/seat_selection/bloc/seat_event.dart';
import 'package:timos_customer_2025/screen/seat_selection/bloc/seat_state.dart';
import 'package:timos_customer_2025/screen/seat_selection/service/ticket_service.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';

import '../../booking_ticket/ticket_price/model/seating_model.dart';


class SeatBloc extends Bloc<SeatEvent, SeatState> {
  final ticketService = TicketService();

  SeatBloc() : super(SeatState()) {
    on<InitSeatEvent>((event, emit) async {
      await getSeatingArrangement(event, emit);
    });
  }

  Future<void> getSeatingArrangement(InitSeatEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      SeatingModel seatingModel = await ticketService.getSeatingPlan(
        SeatingRequestModel(
          idLichXe: event.idLichXe,
          idNhaXe: event.idNhaXe,
          idLichXeChay: event.idLichXeChay,
          idLoaiXe: event.idLoaiXe,
          ngayChay: convertDateToString(event.ngayChay, pattern15),
        ),
      );

      if(seatingModel.statusCode == 200) {

        List<DanhSachGheDaDat> setListSeating = seatingModel.data?.danhSachGheDaDat != null
            ? seatingModel.data!.danhSachGheDaDat
            : <DanhSachGheDaDat>[];

        print(setListSeating);



        emit(state.copyWith(listSeating: setListSeating, isLoading: false), );
      }
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }


}
