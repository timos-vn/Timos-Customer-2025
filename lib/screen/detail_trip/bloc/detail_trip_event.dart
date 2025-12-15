import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/cancel_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/tao_lich_nha_xe_request.dart';

// part 'detail_trip_event.freezed.dart';

// @freezed
// class DetailTripEvent with _$DetailTripEvent {
//   const factory DetailTripEvent.loadDetailCoachPaneTrip({
//     required String idLichXeLimousine,
//   }) = LoadDetailCoachPaneTripEvent;
// }

abstract class DetailTripEvent extends Equatable {}

class LoadDetailCoachPaneTripEvent extends DetailTripEvent {
  final String idLichXeLimousine;

  final int tang;

  LoadDetailCoachPaneTripEvent(
      {required this.idLichXeLimousine, required this.tang});

  @override
  List<Object?> get props => [idLichXeLimousine, tang];
}

class CancelTripEvent extends DetailTripEvent {
  final CancelTicketRequest cancelTicketRequest;

  CancelTripEvent({
    required this.cancelTicketRequest,
  });

  @override
  List<Object?> get props => [cancelTicketRequest];
}

class IdTripEvent extends DetailTripEvent {
  final TaoLichNhaXeRequest taoLichNhaXeRequest;

  IdTripEvent({required this.taoLichNhaXeRequest});

  @override
  List<Object?> get props => [taoLichNhaXeRequest];
}

class TinhSoGheTrong extends DetailTripEvent {
  final int tang;

  TinhSoGheTrong({required this.tang});

  @override
  List<Object?> get props => [tang];
}

class HuyGiuChoEvent extends DetailTripEvent {
  final String idLich;
  final List<GhesDatCho> listGhe;
  final int idTuyenDuong;
  final int idNhaXe;
  final int idLichChayXe;
  final DateTime ngayChay;

  HuyGiuChoEvent({
    required this.idLich,
    required this.listGhe,
    required this.idTuyenDuong,
    required this.idNhaXe,
    required this.idLichChayXe,
    required this.ngayChay,
  });

  @override
  List<Object?> get props =>
      [idLich, listGhe, idTuyenDuong, idNhaXe, idLichChayXe, ngayChay];
}
