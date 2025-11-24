import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/ticket_price_event.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/ticket_price_state.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/service/ticket_repository.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';

class TicketPriceBloc extends Bloc<TicketPriceEvent, TicketPriceState> {
  final _ticketRepository = TicketRepository();

  TicketPriceBloc()
      : super(TicketPriceState()) {
    on<GetTypeTicketBusEvent>((event, emit) async {
      await getTypeTicketBus(event, emit);
    });
  }

  Future<void> getTypeTicketBus(
      GetTypeTicketBusEvent event, Emitter emit) async {
    try {
      final typeTicketBus = await _ticketRepository.getTypeTicketBus(
        loaiHinhDichVu: event.loaiHinhDichVu,
        idTinhDi: event.idTinhDi,
        idTinhDen: event.idTinhDen,
        gioDi: convertDateToString(event.gioDi, pattern13),
        loaiXe: event.loaiXe,
        ngayChay: convertDateToString(event.ngayChay, pattern15),
        tuKhoa: event.tuKhoa,
      );

      if(typeTicketBus.statusCode == 200){
        List<ThongTinTuyenDuong> listTuyen = typeTicketBus.data?.thongTinTuyenDuongs ?? [];
        emit(state.copyWith(listTuyen: listTuyen, typeTicketBusModel: typeTicketBus));
      }
    } finally {

    }
  }


}