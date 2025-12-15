import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timos_customer_2025/const/const.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_update_rquest.dart';
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
      // Load danh sách trung chuyển khi khởi tạo
      add(LoadTransferStationsEvent());
    });

    on<LoadTransferStationsEvent>((event, emit) async {
      await loadTransferStations(emit);
    });

    on<ToggleTransferPickupEvent>((event, emit) {
      emit(state.copyWith(
        isTransferPickupEnabled: event.enabled,
        selectedTransferPickup:
            event.enabled ? null : null, // Reset selection if disabled
      ));
    });

    on<ToggleTransferDropoffEvent>((event, emit) {
      emit(state.copyWith(
        isTransferDropoffEnabled: event.enabled,
        selectedTransferDropoff:
            event.enabled ? null : null, // Reset selection if disabled
      ));
    });

    on<SelectTransferPickupEvent>((event, emit) {
      emit(state.copyWith(selectedTransferPickup: event.item));
    });

    on<SelectTransferDropoffEvent>((event, emit) {
      emit(state.copyWith(selectedTransferDropoff: event.item));
    });

    on<BookTicketEvent>((event, emit) async {
      await bookingTicket(event, emit);
    });

    on<BookTicketUpdateEvent>((event, emit) async {
      await updateTicket(event, emit);
    });

    on<GiuChoEvent>((event, emit) async {
      await datDuCho(event);
    });
  }

  Future<void> loadTransferStations(Emitter emit) async {
    emit(state.copyWith(isLoadingTransferStations: true));
    try {
      final response = await ticketService.getTransferStations();
      emit(state.copyWith(
        transferStations: response.data,
        isLoadingTransferStations: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoadingTransferStations: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> datDuCho(GiuChoEvent event) async {
    await giuChoDatVe(event.idLich, event.listGhe.cast<GhesDatCho>(),
        event.idTuyenDuong, event.idNhaXe, event.idLichChayXe, event.ngayChay);
  }

  Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    try {
      if (GetPlatform.isAndroid) {
        print("GetPlatform.isAndroid");
        // Android
        final androidInfo = await deviceInfo.androidInfo;
        return androidInfo.id; // Android ID (không unique tuyệt đối)
        // Hoặc dùng: androidInfo.serialNumber (API 29 trở xuống)
      } else if (GetPlatform.isIOS) {
        // iOS
        print("GetPlatform.isIOS");
        final iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // UUID unique cho mỗi app vendor
      }
    } catch (e) {
      print("Lỗi lấy device id: $e");
    }

    return null;
  }

  Future<void> giuChoDatVe(
      String idLich,
      List<GhesDatCho> listGhe,
      int idTuyenDuong,
      int idNhaXe,
      int idLichChayXe,
      DateTime ngayChay) async {

    String idDevice = await getDeviceId() ?? '';
    await ticketService.giuChoVe(idLich, listGhe, idDevice, idTuyenDuong, idNhaXe, idLichChayXe, ngayChay);
  }

  // Future<void> bookingTicket(
  //     ConfirmTicketEvent event, Emitter<TicketDetailState> emit) async {
  //   emit(state.copyWith(isLoading: true, errorMessage: null));
  //
  //   List<ChiTietGhe> listChiTietGhe = [];
  //
  //   for (SoDoGheLoaiX soDoGhe in event.soDuocChon) {
  //     ChiTietGhe chiTietGhe = ChiTietGhe(
  //       tang: soDoGhe.tang,
  //       hang: soDoGhe.hang,
  //       day: soDoGhe.day,
  //       giaVe: soDoGhe.giaVe.toInt(),
  //       diemBan: 1,
  //       tenGhe: soDoGhe.tenGhe,
  //     );
  //     listChiTietGhe.add(chiTietGhe);
  //   }
  //
  //   try {
  //     BookTicketModel bookTicketModel = BookTicketModel(
  //       idNhaXe: event.ticketDetailModel.idNhaXe ?? 0,
  //       hoTen: event.nameCustomer,
  //       dienThoai: event.phoneCustomer,
  //       diaChiKhachDi: event.ticketDetailModel.pickup ?? '',
  //       diaChiKhachDen: event.ticketDetailModel.dropoff ?? '',
  //       tienCocVe: 0,
  //       khachTcDon: false,
  //       khachTcTra: false,
  //       idNhaTcDon: null,
  //       idNhaTcTra: null,
  //       isVeTangCuong: false,
  //       idChang: event.ticketDetailModel.idChang ?? 0,
  //       idVanPhongDon: event.ticketDetailModel.idVanPhongDon ?? 0,
  //       idVanPhongTra: event.ticketDetailModel.idVanPhongTra ?? 0,
  //       daThanhToan: false,
  //       ghiChu: "Đặt vé vãng lai",
  //       chiTietGhes: listChiTietGhe,
  //       nguoiTao: null,
  //       loaiDatVe: 3,
  //       idNhanVienPhucVu: "",
  //       thoiGianDatVe: DateTime.now(),
  //       yeuCauXuatHoaDon: false,
  //       thongTinHoaDon: null,
  //       ngayChay: event.ticketDetailModel.departureDate,
  //       idLichChayXe: event.ticketDetailModel.idLichChayXe ?? 0,
  //       doman: "",
  //       ip: "",
  //       deVice: event.idDevice,
  //     );
  //
  //     await ticketService.bookTicket(bookTicketModel);
  //
  //     // if()
  //
  //     emit(state.copyWith(isBookingSuccess: true));
  //     print("Thành công");
  //   } catch (e) {
  //     print("Lỗi: $e");
  //     emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
  //   } finally {
  //     emit(state.copyWith(isLoading: false));
  //   }
  // }

  Future<void> bookingTicket(BookTicketEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    BookTicketResponse response;
    try {
      final box = GetStorage();
      String userId = box.read(Const.USER_ID);
      BookTicketRequest bookTicketModel = BookTicketRequest(
        idNhaXe: event.idNhaXe,
        hoTen: event.nameCustomer,
        dienThoai: event.phoneCustomer,
        diaChiKhachDi: event.diaChiDi,
        diaChiKhachDen: event.diaChiDen,
        tienCocVe: 0,
        khachTcDon: event.isTransferPickupEnabled,
        khachTcTra: event.isTransferDropoffEnabled,
        idNhaTcDon:
            event.idNhaTcDon != null ? int.tryParse(event.idNhaTcDon!) : null,
        idNhaTcTra:
            event.idNhaTcTra != null ? int.tryParse(event.idNhaTcTra!) : null,
        isVeTangCuong: false,
        idChang: event.idChang,
        idVanPhongDon: null,
        idVanPhongTra: null,
        daThanhToan: false,
        ghiChu: "Đặt vé vãng lai",
        chiTietGhes: event.chiTietGhe.toList(),
        nguoiTao: userId,
        loaiDatVe: 1,
        idNhanVienPhucVu: null,
        thoiGianDatVe: DateTime.now(),
        yeuCauXuatHoaDon: false,
        thongTinHoaDon: null,
        ngayChay: event.ticketDetailModel.departureDate,
        idLichChayXe: event.idLichChayXe,
        domain: "",
        ip: "",
        deVice: event.idDevice,
        idLichXe: event.idLichXe,
        ipClient: '',
      );
      response = await ticketService.bookTicket(bookTicketModel);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: null,
        bookTicketResponse: response,
        codeScreen: 1,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        bookTicketResponse: null,
        codeScreen: 1,
      ));
    }
  }

  Future<void> updateTicket(BookTicketUpdateEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    BookTicketResponse response;
    try {
      final box = GetStorage();
      String userId = box.read(Const.USER_ID);
      BookTicketUpdateRequest bookTicketModel = BookTicketUpdateRequest(
        idNhaXe: event.idNhaXe,
        hoTen: event.nameCustomer,
        dienThoai: event.phoneCustomer,
        diaChiKhachDi: event.diaChiDi,
        diaChiKhachDen: event.diaChiDen,
        tienCocVe: 0,
        khachTcDon: event.isTransferPickupEnabled,
        khachTcTra: event.isTransferDropoffEnabled,
        idNhaTcDon:
            event.idNhaTcDon != null ? int.tryParse(event.idNhaTcDon!) : null,
        idNhaTcTra:
            event.idNhaTcTra != null ? int.tryParse(event.idNhaTcTra!) : null,
        isVeTangCuong: false,
        idChang: event.idChang,
        idVanPhongDon: null,
        idVanPhongTra: null,
        daThanhToan: false,
        ghiChu: "Đặt vé vãng lai",
        chiTietGhes: event.chiTietGhe.toList(),
        nguoiTao: userId,
        loaiDatVe: 1,
        idNhanVienPhucVu: "",
        thoiGianDatVe: DateTime.now(),
        yeuCauXuatHoaDon: false,
        thongTinHoaDon: null,
        ngayChay: event.ticketDetailModel.departureDate,
        idLichChayXe: event.idLichChayXe,
        doman: "",
        ip: "",
        deVice: event.idDevice,
        idLichXe: event.idLichXe,
        ipClient: '',
        maDatCho: event.maDatCho,
      );
      response = await ticketService.updateTicket(bookTicketModel);
      emit(state.copyWith(
        isLoading: false,
        errorMessage: null,
        bookTicketResponse: response,
        codeScreen: 2,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        bookTicketResponse: null,
        codeScreen: 2,
      ));
    }
  }
}
