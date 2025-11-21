import 'package:equatable/equatable.dart';

abstract class SeatEvent extends Equatable {}

class InitSeatEvent extends SeatEvent {

  final String idLichXe;
  final int idLichXeChay;
  final int idNhaXe;
  final int idLoaiXe;
  final DateTime ngayChay;

  InitSeatEvent({
    required this.idLichXe,
    required this.idLichXeChay,
    required this.idNhaXe,
    required this.idLoaiXe,
    required this.ngayChay,
  });


  @override
  List<Object?> get props => [idLichXe, idLichXeChay, idNhaXe, idLoaiXe, ngayChay];
}