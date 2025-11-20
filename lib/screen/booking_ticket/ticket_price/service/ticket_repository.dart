
import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';

class TicketRepository extends BaseRepository {
  Future<TypeTicketBusModel> getTypeTicketBus({
    required int loaiHinhDichVu,
    required String idTinhDi,
    required String idTinhDen,
    required String gioDi,
    required int loaiXe,
    required String ngayChay,
    String tuKhoa = "",
  }) async {
    final value = await baseCallApi(
      "https://devapicus.trungchuyenhn.com/api/v2/khach-hang-dat-ve/loc-chuyen-di-theo-tinh",
      "POST",
      jsonMap: {
        "loaiHinhDichVu": loaiHinhDichVu,
        "idTinhDi": idTinhDi,
        "idTinhDen": idTinhDen,
        "khungGio": 0,
        "gioDi": "21:00",
        "idLoaiXe": loaiXe,
        "ngayChay": ngayChay,
        "tuKhoa": tuKhoa
      },
      isToken: false,
    );
    return TypeTicketBusModel.fromJson(value);
  }

}
