import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';

abstract class RoadTripEvent extends Equatable {}

class InitRoadTripEvent extends RoadTripEvent {

  final TypeTicketBusModel? typeTicketBusModel;


  final ThongTinTuyenDuong? thongTinTuyenDuong;

  InitRoadTripEvent({required this.typeTicketBusModel, required this.thongTinTuyenDuong});
  @override
  List<Object?> get props => [typeTicketBusModel, thongTinTuyenDuong];
}