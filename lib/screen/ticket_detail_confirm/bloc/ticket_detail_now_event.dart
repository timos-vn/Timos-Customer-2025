import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';

abstract class TicketDetailNowEvent extends Equatable {}

class InitDataEvent extends TicketDetailNowEvent {
  final TicketDetailModel ticketDetailModel;

  InitDataEvent({required this.ticketDetailModel});

  @override
  List<Object?> get props => [ticketDetailModel];
}

class ConfirmTicketEvent extends TicketDetailNowEvent {
  final TicketDetailModel ticketDetailModel;
  final String nameCustomer;
  final String phoneCustomer;
  final String idDevice;

  final Set<SoDoGheLoaiX> soDuocChon;


  ConfirmTicketEvent({
    required this.ticketDetailModel,
    required this.nameCustomer,
    required this.phoneCustomer,
    required this.idDevice,
    this.soDuocChon = const {},
  });

  @override
  List<Object?> get props => [
        ticketDetailModel,
        nameCustomer,
        phoneCustomer,
        idDevice,
        soDuocChon
  ];
}
