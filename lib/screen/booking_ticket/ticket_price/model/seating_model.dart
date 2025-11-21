class SeatingModel {
  SeatingModel({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  final Data? data;
  final int statusCode;
  final String message;

  factory SeatingModel.fromJson(Map<String, dynamic> json){
    return SeatingModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "statusCode": statusCode,
    "message": message,
  };

}

class Data {
  Data({
    required this.idLichXe,
    required this.ngayChay,
    required this.idLoaiXe,
    required this.tenLoaiXe,
    required this.idNhaXe,
    required this.tenNhaXe,
    required this.danhSachGheDaDat,
    required this.tongSoGheDaDat,
    required this.tongSoGheCoSan,
  });

  final String idLichXe;
  final DateTime? ngayChay;
  final int idLoaiXe;
  final String tenLoaiXe;
  final int idNhaXe;
  final String tenNhaXe;
  final List<DanhSachGheDaDat> danhSachGheDaDat;
  final int tongSoGheDaDat;
  final int tongSoGheCoSan;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      idLichXe: json["idLichXe"] ?? "",
      ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
      idLoaiXe: json["idLoaiXe"] ?? 0,
      tenLoaiXe: json["tenLoaiXe"] ?? "",
      idNhaXe: json["idNhaXe"] ?? 0,
      tenNhaXe: json["tenNhaXe"] ?? "",
      danhSachGheDaDat: json["danhSachGheDaDat"] == null ? [] : List<DanhSachGheDaDat>.from(json["danhSachGheDaDat"]!.map((x) => DanhSachGheDaDat.fromJson(x))),
      tongSoGheDaDat: json["tongSoGheDaDat"] ?? 0,
      tongSoGheCoSan: json["tongSoGheCoSan"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "idLichXe": idLichXe,
    "ngayChay": ngayChay?.toIso8601String(),
    "idLoaiXe": idLoaiXe,
    "tenLoaiXe": tenLoaiXe,
    "idNhaXe": idNhaXe,
    "tenNhaXe": tenNhaXe,
    "danhSachGheDaDat": danhSachGheDaDat.map((x) => x?.toJson()).toList(),
    "tongSoGheDaDat": tongSoGheDaDat,
    "tongSoGheCoSan": tongSoGheCoSan,
  };

}

class DanhSachGheDaDat {
  DanhSachGheDaDat({
    required this.idVe,
    required this.maDatCho,
    required this.tang,
    required this.day,
    required this.hang,
    required this.tenGhe,
    required this.maLoaiGhe,
    required this.tenLoaiGhe,
    required this.tenKhachHang,
    required this.soDienThoai,
    required this.giaVe,
    required this.daThanhToan,
    required this.trangThaiVe,
    required this.tenTrangThaiVe,
    required this.ngayDatVe,
    required this.ghiChu,
    required this.tenNhanVienGiuCho,
    required this.thoiGianGiuCho,
  });

  final String idVe;
  final int maDatCho;
  final int tang;
  final int day;
  final int hang;
  final String tenGhe;
  final String maLoaiGhe;
  final String tenLoaiGhe;
  final String tenKhachHang;
  final String soDienThoai;
  final num giaVe;
  final bool daThanhToan;
  final int trangThaiVe;
  final String tenTrangThaiVe;
  final DateTime? ngayDatVe;
  final String ghiChu;
  final String tenNhanVienGiuCho;
  final dynamic thoiGianGiuCho;

  factory DanhSachGheDaDat.fromJson(Map<String, dynamic> json){
    return DanhSachGheDaDat(
      idVe: json["idVe"] ?? "",
      maDatCho: json["maDatCho"] ?? 0,
      tang: json["tang"] ?? 0,
      day: json["day"] ?? 0,
      hang: json["hang"] ?? 0,
      tenGhe: json["tenGhe"] ?? "",
      maLoaiGhe: json["maLoaiGhe"] ?? "",
      tenLoaiGhe: json["tenLoaiGhe"] ?? "",
      tenKhachHang: json["tenKhachHang"] ?? "",
      soDienThoai: json["soDienThoai"] ?? "",
      giaVe: json["giaVe"] ?? 0,
      daThanhToan: json["daThanhToan"] ?? false,
      trangThaiVe: json["trangThaiVe"] ?? 0,
      tenTrangThaiVe: json["tenTrangThaiVe"] ?? "",
      ngayDatVe: DateTime.tryParse(json["ngayDatVe"] ?? ""),
      ghiChu: json["ghiChu"] ?? "",
      tenNhanVienGiuCho: json["tenNhanVienGiuCho"] ?? "",
      thoiGianGiuCho: json["thoiGianGiuCho"],
    );
  }

  Map<String, dynamic> toJson() => {
    "idVe": idVe,
    "maDatCho": maDatCho,
    "tang": tang,
    "day": day,
    "hang": hang,
    "tenGhe": tenGhe,
    "maLoaiGhe": maLoaiGhe,
    "tenLoaiGhe": tenLoaiGhe,
    "tenKhachHang": tenKhachHang,
    "soDienThoai": soDienThoai,
    "giaVe": giaVe,
    "daThanhToan": daThanhToan,
    "trangThaiVe": trangThaiVe,
    "tenTrangThaiVe": tenTrangThaiVe,
    "ngayDatVe": ngayDatVe?.toIso8601String(),
    "ghiChu": ghiChu,
    "tenNhanVienGiuCho": tenNhanVienGiuCho,
    "thoiGianGiuCho": thoiGianGiuCho,
  };

}
