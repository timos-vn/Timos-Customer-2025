import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/models/network/request.dart';
import 'package:timos_customer_2025/services/auth_service.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/cancel_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/cancel_ticket_response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/id_chuyen_nha_xe_response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/tao_lich_nha_xe_request.dart';

class TripService extends BaseRepository {
  static final TripService _instance = TripService._internal();

  factory TripService() => _instance;
  TripService._internal();

  Future<TripListResponse> getPendingResolvedTripList(
      {required int pageIndex,
      required int pageSize,
      String? tuKhoa,
      required String ngayChay,
      required String idNhanVien,
      required int idNhom,
      String? idDoiTac}) async {
    try {
      final request = TripListRequest(
          pageIndex: pageIndex,
          pageSize: pageSize,
          tuKhoa: tuKhoa,
          ngayChay: ngayChay,
          idNhanVien: idNhanVien,
          idNhom: idNhom,
          idDoiTac: idDoiTac);
      print("pending trip request: ${request.toJson()}");
      final response = await baseCallApi(
        '/api/v1/vanglai/danh-sach-khach-can-xu-ly',
        EnumRequestMethod.post,
        jsonMap: request.toJson(),
        isToken: true,
      );

      if (response == null) {
        throw Exception('Response is null');
      }

      if (response is! Map<String, dynamic>) {
        throw Exception(
            'Response is not a valid JSON object: ${response.runtimeType}');
      }

      return TripListResponse.fromJson(response);
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách chuyến đi: $e');
    }
  }

  Future<TripListResponse> getProcessingTripList(
      {required int pageIndex,
      required int pageSize,
      String? tuKhoa,
      required String ngayChay,
      required String idNhanVien,
      required int idNhom,
      String? idDoiTac}) async {
    try {
      final request = TripListRequest(
          pageIndex: pageIndex,
          pageSize: pageSize,
          tuKhoa: tuKhoa,
          ngayChay: ngayChay,
          idNhanVien: idNhanVien,
          idNhom: idNhom,
          idDoiTac: idDoiTac);
      print("processing trip request: ${request.toJson()}");
      final response = await baseCallApi(
        '/api/v1/vanglai/danh-sach-khach-dang-xu-ly',
        EnumRequestMethod.post,
        jsonMap: request.toJson(),
        isToken: true,
      );

      if (response == null) {
        throw Exception('Response is null');
      }

      if (response is! Map<String, dynamic>) {
        throw Exception(
            'Response is not a valid JSON object: ${response.runtimeType}');
      }

      return TripListResponse.fromJson(response);
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách chuyến đi: $e');
    }
  }

  Future<CoachPaneTripResponse> getCoachTripList({
    required int idNhaXe,
    required int idLoaiNhaXe,
    required String idNhanVien,
    required String ngayBatDau,
    required String ngayKetThuc,
    int pageIndex = 1,
    int pageSize = 20,
  }) async {
    try {
      // Kiểm tra chucVu để quyết định có truyền idNhanVien hay không
      final user = AuthService.currentUser;
      final chucVu = user?.chucVu ?? 0;
      final shouldIncludeIdNhanVien = chucVu != 5 && chucVu != 6;
      
      final request = CoachPaneTripRequest(
        idNhaXe: idNhaXe,
        idLoaiNhaXe: idLoaiNhaXe,
        idNhanVien: shouldIncludeIdNhanVien ? idNhanVien : null,
        ngayBatDau: ngayBatDau,
        ngayKetThuc: ngayKetThuc,
        // ngayBatDau: "2025-08-19",
        // ngayKetThuc: "2025-10-24",
        pageIndex: pageIndex,
        pageSize: pageSize,
      );
      
      // Loại bỏ idNhanVien khỏi JSON nếu null
      final requestJson = request.toJson();
      if (requestJson['idNhanVien'] == null) {
        requestJson.remove('idNhanVien');
      }
      
      print("coach trip request: $requestJson");
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/danh-sach-chuyen-di',
        EnumRequestMethod.post,
        jsonMap: requestJson,
        isToken: true,
      );
      print("coach trip response: $response");
      if (response == null) {
        throw Exception('Response is null');
      }

      if (response is! Map<String, dynamic>) {
        throw Exception(
            'Response is not a valid JSON object: ${response.runtimeType}');
      }

      return CoachPaneTripResponse.fromJson(response);
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách chuyến đi: $e');
    }
  }

  Future<DetailCoachPaneTripResponse> getDetailCoachTrip({
    required String idLichXeLimousine,
  }) async {
    try {
      final request = DetailCoachPaneTripRequest(
        idLichXeLimousine: idLichXeLimousine,
      );
      print("detail coach trip request: ${request.toJson()}");
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/chi-tiet-chuyen-di',
        EnumRequestMethod.post,
        jsonMap: request.toJson(),
        isToken: true,
      );
      print("detail coach trip response: $response");
      if (response == null) {
        throw Exception('Response is null');
      }

      if (response is! Map<String, dynamic>) {
        throw Exception(
            'Response is not a valid JSON object: ${response.runtimeType}');
      }

      return DetailCoachPaneTripResponse.fromJson(response);
    } catch (e) {
      throw Exception('Lỗi khi lấy chi tiết chuyến đi: $e');
    }
  }

  Future<CancelTicketResponse> cancelTicket({
    required CancelTicketRequest cancelTicketRequest,
  }) async {
    try {
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/huy-ve-vang-lai',
        EnumRequestMethod.post,
        jsonMap: cancelTicketRequest.toJson(),
        isToken: true,
      );
      if (response == null) {
        throw Exception('Response is null');
      }

      if (response is! Map<String, dynamic>) {
        throw Exception(
            'Response is not a valid JSON object: ${response.runtimeType}');
      }

      return CancelTicketResponse.fromJson(response);
    } catch (e) {
      throw Exception('Lỗi khi lấy chi tiết chuyến đi: $e');
    }
  }

  Future<IdChuyenDiResponse> layIdNhaXe({required TaoLichNhaXeRequest taoLichNhaXeRequest}) async {
    try {
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/tao-moi-lich-xe-limousine',
        EnumRequestMethod.post,
        jsonMap: taoLichNhaXeRequest.toJson(),
        isToken: true,
      );
      if (response == null) {
        throw Exception('Response is null');
      }

      if (response is! Map<String, dynamic>) {
        throw Exception(
            'Response is not a valid JSON object: ${response.runtimeType}');
      }

      return IdChuyenDiResponse.fromJson(response);
    } catch (e) {
      throw Exception('Lỗi khi lấy chi tiết chuyến đi: $e');
    }
  }

  /// Lấy danh sách vé sân bay
  Future<Map<String, dynamic>> getAirportTicketList({
    required String idChuyenDi,
    required int pageIndex,
    required int pageSize,
  }) async {
    try {
      final requestJson = {
        "idChuyenDi": idChuyenDi,
        "pageIndex": pageIndex,
        "pageSize": pageSize,
      };
      print("airport ticket list request: $requestJson");
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/danh-sach-ve-san-bay',
        EnumRequestMethod.get,
        isQueryParametersPost: true,
        jsonMap: requestJson,
        isToken: true,
      );
      print("airport ticket list response: $response");
      if (response == null) {
        throw Exception('Response is null');
      }

      if (response is! Map<String, dynamic>) {
        throw Exception(
            'Response is not a valid JSON object: ${response.runtimeType}');
      }

      return response;
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách vé sân bay: $e');
    }
  }

  /// Sửa vé sân bay
  Future<void> updateAirportTicket({
    required String idVeSanBay,
    required String thoiGianDon,
    required String diaChiDi,
    required String diaChiDen,
    required int giaVe,
    required bool daThanhToan,
    required String ghiChu,
    required String tenKhachHang,
    required String soDienThoai,
    required String nguoiSua,
  }) async {
    try {
      final requestJson = {
        "idVeSanBay": idVeSanBay,
        "thoiGianDon": thoiGianDon,
        "diaChiDi": diaChiDi,
        "diaChiDen": diaChiDen,
        "giaVe": giaVe,
        "daThanhToan": daThanhToan,
        "idVanPhongDi": 0,
        "idVanPhongDen": 0,
        "ghiChu": ghiChu,
        "tenKhachHang": tenKhachHang,
        "soDienThoai": soDienThoai,
        "nguoiSua": nguoiSua,
      };
      print("update airport ticket request: $requestJson");
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/sua-ve-san-bay',
        EnumRequestMethod.put,
        jsonMap: requestJson,
        isToken: true,
      );
      print("update airport ticket response: $response");
    } catch (e) {
      throw Exception('Lỗi khi sửa vé sân bay: $e');
    }
  }

  /// Xóa vé sân bay
  Future<void> deleteAirportTicket({
    required String idVeSanBay,
    required String lyDoXoa,
    required String nguoiXoa,
  }) async {
    try {
      final requestJson = {
        "idVeSanBay": idVeSanBay,
        "lyDoXoa": lyDoXoa,
        "nguoiXoa": nguoiXoa,
      };
      print("delete airport ticket request: $requestJson");
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/xoa-ve-san-bay',
        EnumRequestMethod.delete,
        jsonMap: requestJson,
        isToken: true,
      );
      print("delete airport ticket response: $response");
    } catch (e) {
      throw Exception('Lỗi khi xóa vé sân bay: $e');
    }
  }
}
