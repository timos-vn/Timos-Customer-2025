import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/models/response/transfer_station/transfer_station_response.dart';
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
  final bool isTransferPickupEnabled;
  final bool isTransferDropoffEnabled;
  final String? idNhaTcDon;
  final String? idNhaTcTra;

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
    this.isTransferPickupEnabled = false,
    this.isTransferDropoffEnabled = false,
    this.idNhaTcDon,
    this.idNhaTcTra,
  });

  @override
  List<Object?> get props => [ticketDetailModel, nameCustomer, phoneCustomer, chiTietGhe, idDevice, diaChiDi, diaChiDen, isTransferPickupEnabled, isTransferDropoffEnabled, idNhaTcDon, idNhaTcTra];
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
  final bool isTransferPickupEnabled;
  final bool isTransferDropoffEnabled;
  final String? idNhaTcDon;
  final String? idNhaTcTra;

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
    this.isTransferPickupEnabled = false,
    this.isTransferDropoffEnabled = false,
    this.idNhaTcDon,
    this.idNhaTcTra,
  });

  @override
  List<Object?> get props => [ticketDetailModel, nameCustomer, phoneCustomer, chiTietGhe, idDevice, diaChiDi, diaChiDen, isTransferPickupEnabled, isTransferDropoffEnabled, idNhaTcDon, idNhaTcTra];
}

class LoadTransferStationsEvent extends TicketDetailNowEvent {
  LoadTransferStationsEvent();

  @override
  List<Object?> get props => [];
}

class ToggleTransferPickupEvent extends TicketDetailNowEvent {
  final bool enabled;

  ToggleTransferPickupEvent({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}

class ToggleTransferDropoffEvent extends TicketDetailNowEvent {
  final bool enabled;

  ToggleTransferDropoffEvent({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}

class SelectTransferPickupEvent extends TicketDetailNowEvent {
  final TransferStationItem? item;

  SelectTransferPickupEvent({this.item});

  @override
  List<Object?> get props => [item];
}

class SelectTransferDropoffEvent extends TicketDetailNowEvent {
  final TransferStationItem? item;

  SelectTransferDropoffEvent({this.item});

  @override
  List<Object?> get props => [item];
}

class GiuChoEvent extends TicketDetailNowEvent {
  final String idLich;
  final int idTuyenDuong;
  final int idNhaXe;
  final int idLichChayXe;
  final DateTime ngayChay;
  final List<GhesDatCho> listGhe;

  GiuChoEvent({
    required this.idLich,
    required this.listGhe,
    required this.idTuyenDuong,
    required this.idNhaXe,
    required this.idLichChayXe,
    required this.ngayChay,
  });

  @override
  List<Object?> get props => [idLich, listGhe, idTuyenDuong, idNhaXe, idLichChayXe, ngayChay];
}

class HuyGiuChoEvent extends TicketDetailNowEvent {
  final String idLich;
  final List<GhesDatCho> listGhe;

  HuyGiuChoEvent({
    required this.idLich,
    required this.listGhe,
  });

  @override
  List<Object?> get props =>
      [idLich, listGhe];
}
