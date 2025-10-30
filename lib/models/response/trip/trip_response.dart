import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_response.freezed.dart';
part 'trip_response.g.dart';

@freezed
class TripListResponse with _$TripListResponse {
  const factory TripListResponse({
    @Default(0) int totalDonKhach,
    @Default(0) int totalTraKhach,
    List<TripItem>? data,
    @Default(0) int statusCode,
    String? message,
    @Default(0) int pageIndex,
    @Default(0) int pageSize,
    @Default(0) int totalRecords,
    @Default(0) int pageCount,
  }) = _TripListResponse;

  factory TripListResponse.fromJson(Map<String, dynamic> json) =>
      _$TripListResponseFromJson(json);
}

extension TripListResponseX on TripListResponse {
  bool get isSuccess => statusCode == 200 && data != null;
}

@freezed
class TripItem with _$TripItem {
  const factory TripItem({
    @Default('') String idDatVe,
    @Default('') String idYeuCauDatVe,
    @Default('') String idTaiXeTC,
    @Default('') String maVe,
    @Default('') String idDatVeTotal,
    @Default('') String soGhe,
    String? hoTenTaiXeTrungChuyen,
    String? dienThoaiTaiXeTrungChuyen,
    String? tenXeTrungChuyen,
    String? bienSoXeTrungChuyen,
    @Default('') String tenKhachHang,
    @Default('') String soDienThoaiKhach,
    @Default('') String diaChiKhachDi,
    String? toaDoDiaChiKhachDi,
    @Default('') String diaChiKhachDen,
    String? toaDoDiaChiKhachDen,
    String? diaChiLimoDi,
    String? toaDoLimoDi,
    @Default('') String vanPhongDen,
    @Default('') String diaChiLimoDen,
    String? toaDoLimoDen,
    String? ghiChu,
    String? ngayChay,
    String? thoiGianDi,
    @Default(0) int idNhaXeLimo,
    @Default(0) int loaiKhach,
    String? khachTrungChuyen,
    @Default(0) int trangThaiVe,
    @Default(0) int trangThaiTC,
    @Default(0) int daThanhToan,
    @Default(0.0) double tienVe,
    @Default(0.0) double chietKhau,
    @Default(0.0) double soTienCoc,
    String? hoTenKhachDatHo,
    String? soDienThoaiKhachDatHo,
    String? tenNhom,
    @Default(0) int diemBanVe,
    @Default(0) int diemQuanLy,
    @Default(0) int soKhach,
    String? tenHinhThuc,
    String? ngayChayList,
    String? thoiGianList,
    @Default(0) int idHinhThucDiChuyen,
    String? loaVe,
    String? hoTenTaiXe,
    String? dienThoaiTaiXe,
    String? nguoiTao,
    @Default(0) int khuHoiYn,
  }) = _TripItem;

  factory TripItem.fromJson(Map<String, dynamic> json) =>
      _$TripItemFromJson(json);
}
