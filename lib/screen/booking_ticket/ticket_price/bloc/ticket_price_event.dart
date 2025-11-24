import 'package:equatable/equatable.dart';

abstract class TicketPriceEvent extends Equatable {}

class GetTypeTicketBusEvent extends TicketPriceEvent {
  final int loaiHinhDichVu;
  final String idTinhDi;
  final String idTinhDen;
  final DateTime gioDi;
  final int loaiXe;
  final DateTime ngayChay;
  final String tuKhoa;

  GetTypeTicketBusEvent({
    required this.loaiHinhDichVu,
    required this.idTinhDi,
    required this.idTinhDen,
    required this.gioDi,
    required this.loaiXe,
    required this.ngayChay,
    this.tuKhoa = "",
  });

  @override
  List<Object?> get props => [
        loaiHinhDichVu,
        idTinhDi,
        idTinhDen,
        gioDi,
        loaiXe,
        ngayChay,
        tuKhoa,
      ];
}