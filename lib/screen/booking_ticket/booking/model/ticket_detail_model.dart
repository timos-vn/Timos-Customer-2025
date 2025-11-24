

import 'package:timos_customer_2025/screen/booking_ticket/booking/model/vehicle_type_model.dart';

class TicketDetailModel {

  final String? idDiemLen; // id điểm lẻ lên
  final String? idDiemXuong; // id điểm lẻ xuống

  final String? dropoff; // Điểm trả
  final String? pickup; // Điểm đón
  final String? pickupDetail; // Chi tiết điểm đón
  final String? dropoffDetail; // Chi tiết điểm trả
  final DateTime? departureDate; // ngày đi
  final DateTime? returnDate; // ngày về
  final int? numCustomers; // Số lượng khách hàng
  final bool? isRoundTrip; // Có phải là chuyến đi khứ hồi không
  final int? typeTicket; // Loại vé
  final DatumVehicle? typeCar; // loại xe
  int? price; // giá tiền

  int? idChang;

  int? idNhaXe;

  int? idVanPhongDon;

  int? idVanPhongTra;

  int? idLichChayXe;

  int? idLoaiXe;


  TicketDetailModel({
    this.dropoff,
    this.pickup,
    this.pickupDetail,
    this.dropoffDetail,
    this.departureDate,
    this.returnDate,
    this.numCustomers,
    this.isRoundTrip,
    this.typeTicket,
    this.typeCar,
    this.price,
    this.idChang,
    this.idNhaXe,

    this.idVanPhongDon,
    this.idVanPhongTra,
    this.idLichChayXe,
    this.idLoaiXe,
    this.idDiemLen,
    this.idDiemXuong,
  });
}