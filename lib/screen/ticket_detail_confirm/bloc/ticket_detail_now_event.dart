import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_update_rquest.dart';
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
  List<Object?> get props =>
      [ticketDetailModel, nameCustomer, phoneCustomer, idDevice, soDuocChon];
}

class BookTicketEvent extends TicketDetailNowEvent {
  final TicketDetailModel ticketDetailModel;
  final String nameCustomer;
  final String phoneCustomer;
  final String diaChiDi;
  final String diaChiDen;
  final String idDevice;
  final String idLichXe;
  final int idChang;
  final int idLichChayXe;
  final int idNhaXe;

  final Set<ChiTietGhe> chiTietGhe;

  BookTicketEvent({
     required this.ticketDetailModel,
    required this.nameCustomer,
    required this.phoneCustomer,
    required this.chiTietGhe,
    required this.idDevice,
    required this.diaChiDen,
    required this.diaChiDi,
    required this.idChang,
    required this.idLichChayXe,
    required this.idLichXe,
    required this.idNhaXe,
  });

  @override
  List<Object?> get props => [ticketDetailModel, nameCustomer, phoneCustomer, chiTietGhe, idDevice, diaChiDi, diaChiDen];
}


class BookTicketUpdateEvent extends TicketDetailNowEvent {
  final TicketDetailModel ticketDetailModel;
  final String nameCustomer;
  final String phoneCustomer;
  final String diaChiDi;
  final String diaChiDen;
  final String idDevice;
  final String idLichXe;
  final int idChang;
  final int idLichChayXe;
  final int idNhaXe;
  final int maDatCho;

  final Set<ChiTietGheUpdate> chiTietGhe;

  BookTicketUpdateEvent({
    required this.ticketDetailModel,
    required this.nameCustomer,
    required this.phoneCustomer,
    required this.chiTietGhe,
    required this.idDevice,
    required this.diaChiDen,
    required this.diaChiDi,
    required this.idChang,
    required this.idLichChayXe,
    required this.idLichXe,
    required this.idNhaXe,
    required this.maDatCho,
  });

  @override
  List<Object?> get props => [ticketDetailModel, nameCustomer, phoneCustomer, chiTietGhe, idDevice, diaChiDi, diaChiDen];
}
