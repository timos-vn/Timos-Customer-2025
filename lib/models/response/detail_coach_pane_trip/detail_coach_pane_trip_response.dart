class DetailCoachPaneTripResponse {
  DetailCoachPaneTripResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  final DetailCoachPaneTripData? data;
  final int statusCode;
  final String message;

  factory DetailCoachPaneTripResponse.fromJson(Map<String, dynamic> json){
    return DetailCoachPaneTripResponse(
      data: json["data"] == null ? null : DetailCoachPaneTripData.fromJson(json["data"]),
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

class DetailCoachPaneTripData {
  DetailCoachPaneTripData({
    required this.idLichXeLimousine,
    required this.maLimo,
    required this.bienSoXe,
    required this.ngayChay,
    required this.gioDi,
    required this.tenTaiXe,
    required this.soDienThoaiTaiXe,
    required this.soGheDaDat,
    required this.tongSoGhe,
    required this.tongDoanhThu,
    required this.soGheDaDatCount,
    required this.soGheGiuChoCount,
    required this.soGheTrongCount,
    required this.idLichChayXe,
    required this.danhSachTang,
    required this.tangHienTai,
    required this.danhSachChangDuong,
  });

  final String idLichXeLimousine;
  final String maLimo;
  final String bienSoXe;
  final DateTime? ngayChay;
  final String gioDi;
  final String tenTaiXe;
  final String soDienThoaiTaiXe;
  final int soGheDaDat;
  final int tongSoGhe;
  final num tongDoanhThu;
  final int soGheDaDatCount;
  final int soGheGiuChoCount;
  final int soGheTrongCount;
  final int idLichChayXe;
  final List<TangHienTai> danhSachTang;
  final TangHienTai? tangHienTai;
  final List<DanhSachChangDuong> danhSachChangDuong;

  factory DetailCoachPaneTripData.fromJson(Map<String, dynamic> json){
    return DetailCoachPaneTripData(
      idLichXeLimousine: json["idLichXeLimousine"] ?? "",
      maLimo: json["maLimo"] ?? "",
      bienSoXe: json["bienSoXe"] ?? "",
      ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
      gioDi: json["gioDi"] ?? "",
      tenTaiXe: json["tenTaiXe"] ?? "",
      soDienThoaiTaiXe: json["soDienThoaiTaiXe"] ?? "",
      soGheDaDat: json["soGheDaDat"] ?? 0,
      tongSoGhe: json["tongSoGhe"] ?? 0,
      tongDoanhThu: json["tongDoanhThu"] ?? 0,
      soGheDaDatCount: json["soGheDaDatCount"] ?? 0,
      soGheGiuChoCount: json["soGheGiuChoCount"] ?? 0,
      soGheTrongCount: json["soGheTrongCount"] ?? 0,
      idLichChayXe: json["idLichChayXe"] ?? 0,
      danhSachTang: json["danhSachTang"] == null ? [] : List<TangHienTai>.from(json["danhSachTang"]!.map((x) => TangHienTai.fromJson(x))),
      tangHienTai: json["tangHienTai"] == null ? null : TangHienTai.fromJson(json["tangHienTai"]),
      danhSachChangDuong: json["danhSachChangDuong"] == null ? [] : List<DanhSachChangDuong>.from(json["danhSachChangDuong"]!.map((x) => DanhSachChangDuong.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "idLichXeLimousine": idLichXeLimousine,
    "maLimo": maLimo,
    "bienSoXe": bienSoXe,
    "ngayChay": ngayChay?.toIso8601String(),
    "gioDi": gioDi,
    "tenTaiXe": tenTaiXe,
    "soDienThoaiTaiXe": soDienThoaiTaiXe,
    "soGheDaDat": soGheDaDat,
    "tongSoGhe": tongSoGhe,
    "tongDoanhThu": tongDoanhThu,
    "soGheDaDatCount": soGheDaDatCount,
    "soGheGiuChoCount": soGheGiuChoCount,
    "soGheTrongCount": soGheTrongCount,
    "idLichChayXe": idLichChayXe,
    "danhSachTang": danhSachTang.map((x) => x?.toJson()).toList(),
    "tangHienTai": tangHienTai?.toJson(),
    "danhSachChangDuong": danhSachChangDuong.map((x) => x?.toJson()).toList(),
  };

}

class DanhSachChangDuong {
  DanhSachChangDuong({
    required this.id,
    required this.tenChang,
    required this.thuTu,
  });

  final int id;
  final String tenChang;
  final int thuTu;

  factory DanhSachChangDuong.fromJson(Map<String, dynamic> json){
    return DanhSachChangDuong(
      id: json["id"] ?? 0,
      tenChang: json["tenChang"] ?? "",
      thuTu: json["thuTu"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "tenChang": tenChang,
    "thuTu": thuTu,
  };

}

class TangHienTai {
  TangHienTai({
    required this.tang,
    required this.soGheDaDat,
    required this.soGheGiuCho,
    required this.soGheTrong,
    required this.danhSachGhe,
  });

  final int tang;
  final int soGheDaDat;
  final int soGheGiuCho;
  final int soGheTrong;
  final List<DanhSachGhe> danhSachGhe;

  factory TangHienTai.fromJson(Map<String, dynamic> json){
    return TangHienTai(
      tang: json["tang"] ?? 0,
      soGheDaDat: json["soGheDaDat"] ?? 0,
      soGheGiuCho: json["soGheGiuCho"] ?? 0,
      soGheTrong: json["soGheTrong"] ?? 0,
      danhSachGhe: json["danhSachGhe"] == null ? [] : List<DanhSachGhe>.from(json["danhSachGhe"]!.map((x) => DanhSachGhe.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "tang": tang,
    "soGheDaDat": soGheDaDat,
    "soGheGiuCho": soGheGiuCho,
    "soGheTrong": soGheTrong,
    "danhSachGhe": danhSachGhe.map((x) => x?.toJson()).toList(),
  };

}

class DanhSachGhe {
  DanhSachGhe({
    required this.idGhe,
    required this.tenGhe,
    required this.tang,
    required this.day,
    required this.hang,
    required this.trangThaiGhe,
    required this.tenTrangThaiGhe,
    required this.giaVe,
    required this.tenLoaiGhe,
    required this.mauSac,
    required this.idDatVe,
    required this.tenKhachHang,
    required this.soDienThoaiKhachHang,
    required this.ghiChu,
    required this.diaChiKhachDi,
    required this.diaChiKhachDen,
    required this.khachTrungChuyenDon,
    required this.khachTrungChuyenTra,
    required this.idDiemDon,
    required this.idDiemTra,
    required this.isGheAo,
    required this.isTrungChuyen,
    required this.tenVanPhongDon,
    required this.diaChiVanPhongDon,
    required this.tenVanPhongTra,
    required this.diaChiVanPhongTra,
    required this.tenTaiXeTrungChuyen,
    required this.soDienThoaiTaiXeTrungChuyen,
    required this.bienSoXeTrungChuyen,
  });

  final int idGhe;
  final String tenGhe;
  final int tang;
  final int day;
  final int hang;
  final int trangThaiGhe;
  final String tenTrangThaiGhe;
  final num giaVe;
  final String tenLoaiGhe;
  final String mauSac;
  final String idDatVe;
  final String tenKhachHang;
  final String soDienThoaiKhachHang;
  final String ghiChu;
  final String diaChiKhachDi;
  final String diaChiKhachDen;
  final bool khachTrungChuyenDon;
  final bool khachTrungChuyenTra;
  final int idDiemDon;
  final int idDiemTra;
  final bool isGheAo;
  final bool isTrungChuyen;
  final String tenVanPhongDon;
  final String diaChiVanPhongDon;
  final String tenVanPhongTra;
  final String diaChiVanPhongTra;
  final String tenTaiXeTrungChuyen;
  final String soDienThoaiTaiXeTrungChuyen;
  final String bienSoXeTrungChuyen;

  factory DanhSachGhe.fromJson(Map<String, dynamic> json){
    return DanhSachGhe(
      idGhe: json["idGhe"] ?? 0,
      tenGhe: json["tenGhe"] ?? "",
      tang: json["tang"] ?? 0,
      day: json["day"] ?? 0,
      hang: json["hang"] ?? 0,
      trangThaiGhe: json["trangThaiGhe"] ?? 0,
      tenTrangThaiGhe: json["tenTrangThaiGhe"] ?? "",
      giaVe: json["giaVe"] ?? 0,
      tenLoaiGhe: json["tenLoaiGhe"] ?? "",
      mauSac: json["mauSac"] ?? "",
      idDatVe: json["idDatVe"] ?? "",
      tenKhachHang: json["tenKhachHang"] ?? "",
      soDienThoaiKhachHang: json["soDienThoaiKhachHang"] ?? "",
      ghiChu: json["ghiChu"] ?? "",
      diaChiKhachDi: json["diaChiKhachDi"] ?? "",
      diaChiKhachDen: json["diaChiKhachDen"] ?? "",
      khachTrungChuyenDon: json["khachTrungChuyenDon"] ?? false,
      khachTrungChuyenTra: json["khachTrungChuyenTra"] ?? false,
      idDiemDon: json["idDiemDon"] ?? 0,
      idDiemTra: json["idDiemTra"] ?? 0,
      isGheAo: json["isGheAo"] ?? false,
      isTrungChuyen: json["isTrungChuyen"] ?? false,
      tenVanPhongDon: json["tenVanPhongDon"] ?? "",
      diaChiVanPhongDon: json["diaChiVanPhongDon"] ?? "",
      tenVanPhongTra: json["tenVanPhongTra"] ?? "",
      diaChiVanPhongTra: json["diaChiVanPhongTra"] ?? "",
      tenTaiXeTrungChuyen: json["tenTaiXeTrungChuyen"] ?? "",
      soDienThoaiTaiXeTrungChuyen: json["soDienThoaiTaiXeTrungChuyen"] ?? "",
      bienSoXeTrungChuyen: json["bienSoXeTrungChuyen"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "idGhe": idGhe,
    "tenGhe": tenGhe,
    "tang": tang,
    "day": day,
    "hang": hang,
    "trangThaiGhe": trangThaiGhe,
    "tenTrangThaiGhe": tenTrangThaiGhe,
    "giaVe": giaVe,
    "tenLoaiGhe": tenLoaiGhe,
    "mauSac": mauSac,
    "idDatVe": idDatVe,
    "tenKhachHang": tenKhachHang,
    "soDienThoaiKhachHang": soDienThoaiKhachHang,
    "ghiChu": ghiChu,
    "diaChiKhachDi": diaChiKhachDi,
    "diaChiKhachDen": diaChiKhachDen,
    "khachTrungChuyenDon": khachTrungChuyenDon,
    "khachTrungChuyenTra": khachTrungChuyenTra,
    "idDiemDon": idDiemDon,
    "idDiemTra": idDiemTra,
    "isGheAo": isGheAo,
    "isTrungChuyen": isTrungChuyen,
    "tenVanPhongDon": tenVanPhongDon,
    "diaChiVanPhongDon": diaChiVanPhongDon,
    "tenVanPhongTra": tenVanPhongTra,
    "diaChiVanPhongTra": diaChiVanPhongTra,
    "tenTaiXeTrungChuyen": tenTaiXeTrungChuyen,
    "soDienThoaiTaiXeTrungChuyen": soDienThoaiTaiXeTrungChuyen,
    "bienSoXeTrungChuyen": bienSoXeTrungChuyen,
  };

}
