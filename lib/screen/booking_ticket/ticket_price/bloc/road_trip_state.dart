import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';

class RoadTripState extends Equatable {
  final TypeTicketBusModel? typeTicketBusModel;

  final List<ThongTinTuyenDuongNhax> listThongTinTuyenDuongNhax;

  final TicketDetailModel? ticketDetailModel;

  final ThongTinTuyenDuong? thongTinTuyenDuong;

  const RoadTripState({
    this.typeTicketBusModel,
    this.listThongTinTuyenDuongNhax = const [],
    this.ticketDetailModel,
    this.thongTinTuyenDuong,
  });

  RoadTripState copyWith({
    TypeTicketBusModel? typeTicketBusModel,
    List<ThongTinTuyenDuongNhax>? listThongTinTuyenDuongNhax,
    TicketDetailModel? ticketDetailModel,
    ThongTinTuyenDuong? thongTinTuyenDuong,
  }) {
    return RoadTripState(
      typeTicketBusModel: typeTicketBusModel ?? this.typeTicketBusModel,
      listThongTinTuyenDuongNhax: listThongTinTuyenDuongNhax ?? this.listThongTinTuyenDuongNhax,
      ticketDetailModel: this.ticketDetailModel,
      thongTinTuyenDuong: this.thongTinTuyenDuong,
    );
  }

  @override
  List<Object?> get props => [
        typeTicketBusModel,
    listThongTinTuyenDuongNhax,
        ticketDetailModel,
    thongTinTuyenDuong,
      ];
}
