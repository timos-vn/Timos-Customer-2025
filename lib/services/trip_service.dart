import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/models/network/request.dart';

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
      final request = CoachPaneTripRequest(
        idNhaXe: idNhaXe,
        idLoaiNhaXe: idLoaiNhaXe,
        idNhanVien: idNhanVien,
        ngayBatDau: ngayBatDau,
        ngayKetThuc: ngayKetThuc,
        pageIndex: pageIndex,
        pageSize: pageSize,
      );
      print("coach trip request: ${request.toJson()}");
      final response = await baseCallApi(
        '/api/v1/manage/chuyen-di/danh-sach-chuyen-di',
        EnumRequestMethod.post,
        jsonMap: request.toJson(),
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
}
