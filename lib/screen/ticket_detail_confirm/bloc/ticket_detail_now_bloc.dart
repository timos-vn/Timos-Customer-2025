import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';
import 'package:timos_customer_2025/screen/seat_selection/service/ticket_service.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_event.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_state.dart';

class TicketDetailNowBloc
    extends Bloc<TicketDetailNowEvent, TicketDetailState> {
  TicketService ticketService = TicketService();

  TicketDetailNowBloc()
      : super(TicketDetailState(ticketDetailModel: TicketDetailModel())) {
    on<InitDataEvent>((event, emit) {
      emit(state.copyWith(ticketDetailModel: event.ticketDetailModel));
    });

    on<ConfirmTicketEvent>((event, emit) async {
      await bookingTicket(event, emit);
    });
  }

  Future<void> bookingTicket(
      ConfirmTicketEvent event, Emitter<TicketDetailState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    List<ChiTietGhe> listChiTietGhe = [];

    for (SoDoGheLoaiX soDoGhe in event.soDuocChon) {
      ChiTietGhe chiTietGhe = ChiTietGhe(
        tang: soDoGhe.tang,
        hang: soDoGhe.hang,
        day: soDoGhe.day,
        giaVe: soDoGhe.giaVe.toInt(),
        diemBan: 1,
        tenGhe: soDoGhe.tenGhe,
      );
      listChiTietGhe.add(chiTietGhe);
    }

    try {
      BookTicketModel bookTicketModel = BookTicketModel(
        idNhaXe: event.ticketDetailModel.idNhaXe ?? 0,
        hoTen: event.nameCustomer,
        dienThoai: event.phoneCustomer,
        diaChiKhachDi: event.ticketDetailModel.pickup ?? '',
        diaChiKhachDen: event.ticketDetailModel.dropoff ?? '',
        tienCocVe: 0,
        khachTcDon: false,
        khachTcTra: false,
        idNhaTcDon: null,
        idNhaTcTra: null,
        isVeTangCuong: false,
        idChang: event.ticketDetailModel.idChang ?? 0,
        idVanPhongDon: event.ticketDetailModel.idVanPhongDon ?? 0,
        idVanPhongTra: event.ticketDetailModel.idVanPhongTra ?? 0,
        daThanhToan: false,
        ghiChu: "Đặt vé vãng lai",
        chiTietGhes: listChiTietGhe,
        nguoiTao: null,
        loaiDatVe: 3,
        idNhanVienPhucVu: "",
        thoiGianDatVe: DateTime.now(),
        yeuCauXuatHoaDon: false,
        thongTinHoaDon: null,
        ngayChay: event.ticketDetailModel.departureDate,
        idLichChayXe: event.ticketDetailModel.idLichChayXe ?? 0,
        doman: "",
        ip: "",
        deVice: event.idDevice,
      );

      await ticketService.bookTicket(bookTicketModel);

      // if()

      emit(state.copyWith(isBookingSuccess: true));
      print("Thành công");
    } catch (e) {
      print("Lỗi: $e");
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
