
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';

class TicketPriceState {

  final bool isLoading;

  List<ThongTinTuyenDuong> listTuyen;

  TypeTicketBusModel? typeTicketBusModel;

  TicketPriceState({
    this.isLoading = false,
    this.listTuyen = const [],
    this.typeTicketBusModel,
  });

  TicketPriceState copyWith({
    bool? isLoading,
    List<ThongTinTuyenDuong>? listTuyen,
    TypeTicketBusModel? typeTicketBusModel
  }) {
    return TicketPriceState(
      isLoading: isLoading ?? this.isLoading,
      listTuyen: listTuyen ?? this.listTuyen,
      typeTicketBusModel: typeTicketBusModel ?? this.typeTicketBusModel,
    );
  }
}