class TypeTicketBusModel {
  TypeTicketBusModel({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  final Data? data;
  final int statusCode;
  final dynamic message;

  factory TypeTicketBusModel.fromJson(Map<String, dynamic> json) {
    return TypeTicketBusModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      statusCode: json["statusCode"] ?? 0,
      message: json["message"],
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
    required this.thongTinTuyenDuongs,
    required this.thongTinTuyenDuongNhaxes,
    required this.soDoGheLoaiXes,
  });

  final List<ThongTinTuyenDuong> thongTinTuyenDuongs;
  final List<ThongTinTuyenDuongNhax> thongTinTuyenDuongNhaxes;
  final List<SoDoGheLoaiX> soDoGheLoaiXes;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      thongTinTuyenDuongs: json["thongTinTuyenDuongs"] == null
          ? []
          : List<ThongTinTuyenDuong>.from(json["thongTinTuyenDuongs"]!
              .map((x) => ThongTinTuyenDuong.fromJson(x))),
      thongTinTuyenDuongNhaxes: json["thongTinTuyenDuongNhaxes"] == null
          ? []
          : List<ThongTinTuyenDuongNhax>.from(json["thongTinTuyenDuongNhaxes"]!
              .map((x) => ThongTinTuyenDuongNhax.fromJson(x))),
      soDoGheLoaiXes: json["soDoGheLoaiXes"] == null
          ? []
          : List<SoDoGheLoaiX>.from(
              json["soDoGheLoaiXes"]!.map((x) => SoDoGheLoaiX.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "thongTinTuyenDuongs":
            thongTinTuyenDuongs.map((x) => x?.toJson()).toList(),
        "thongTinTuyenDuongNhaxes":
            thongTinTuyenDuongNhaxes.map((x) => x?.toJson()).toList(),
        "soDoGheLoaiXes": soDoGheLoaiXes.map((x) => x?.toJson()).toList(),
      };
}

class SoDoGheLoaiX {
  SoDoGheLoaiX({
    required this.idLoaiXe,
    required this.tang,
    required this.day,
    required this.hang,
    required this.maLoaiGhe,
    required this.tenLoaiGhe,
    required this.tenGhe,
    required this.loaiXe,
    required this.tenNhanVienGiuCho,
    required this.idNhanVienGiuCho,
    required this.thoiGianGiuCho,
    required this.khoaGhe,
    required this.isDatGhe,
    required this.giaVe,
    required this.soGhe,
    required this.idChang,
  });

  final int idLoaiXe;
  final int tang;
  final int day;
  final int hang;
  final String maLoaiGhe;
  final String tenLoaiGhe;
  final String tenGhe;
  final String loaiXe;
  final dynamic tenNhanVienGiuCho;
  final dynamic idNhanVienGiuCho;
  final dynamic thoiGianGiuCho;
  final bool khoaGhe;
  bool isDatGhe;
  final num giaVe;
  final int soGhe;
  final int idChang;

  factory SoDoGheLoaiX.fromJson(Map<String, dynamic> json) {
    return SoDoGheLoaiX(
      idLoaiXe: json["idLoaiXe"] ?? 0,
      tang: json["tang"] ?? 0,
      day: json["day"] ?? 0,
      hang: json["hang"] ?? 0,
      maLoaiGhe: json["maLoaiGhe"] ?? "",
      tenLoaiGhe: json["tenLoaiGhe"] ?? "",
      tenGhe: json["tenGhe"] ?? "",
      loaiXe: json["loaiXe"] ?? "",
      tenNhanVienGiuCho: json["tenNhanVienGiuCho"],
      idNhanVienGiuCho: json["idNhanVienGiuCho"],
      thoiGianGiuCho: json["thoiGianGiuCho"],
      khoaGhe: json["khoaGhe"] ?? false,
      isDatGhe: json["isDatGhe"] ?? false,
      giaVe: json["giaVe"] ?? 0.0,
      soGhe: json["soGhe"] ?? 0,
      idChang: json["idChang"] ?? 0
    );
  }

  Map<String, dynamic> toJson() => {
        "idLoaiXe": idLoaiXe,
        "tang": tang,
        "day": day,
        "hang": hang,
        "maLoaiGhe": maLoaiGhe,
        "tenLoaiGhe": tenLoaiGhe,
        "tenGhe": tenGhe,
        "loaiXe": loaiXe,
        "tenNhanVienGiuCho": tenNhanVienGiuCho,
        "idNhanVienGiuCho": idNhanVienGiuCho,
        "thoiGianGiuCho": thoiGianGiuCho,
        "khoaGhe": khoaGhe,
        "isDatGhe": isDatGhe,
      };
}

class ThongTinTuyenDuongNhax {
  ThongTinTuyenDuongNhax({
    required this.idLichChayXe,
    required this.gioDi,
    required this.gioDen,
    required this.tenTuyenDuong,
    required this.thoiGianHanhTrinh,
    required this.lichTrinh,
    required this.idTuyenDuong,
    required this.idNhaXe,
    required this.tenNhaXe,
    required this.loaiXe,
    required this.idLoaiXe,
    required this.giaVe,
  });

  final int idLichChayXe;
  final String gioDi;
  final String gioDen;
  final String tenTuyenDuong;
  final dynamic thoiGianHanhTrinh;
  final dynamic lichTrinh;
  final int idTuyenDuong;
  final int idNhaXe;
  final String tenNhaXe;
  final String loaiXe;
  final int idLoaiXe;
  final num giaVe;

  factory ThongTinTuyenDuongNhax.fromJson(Map<String, dynamic> json) {
    return ThongTinTuyenDuongNhax(
      idLichChayXe: json["idLichChayXe"] ?? 0,
      gioDi: json["gioDi"] ?? "",
      gioDen: json["gioDen"] ?? "",
      tenTuyenDuong: json["tenTuyenDuong"] ?? "",
      thoiGianHanhTrinh: json["thoiGianHanhTrinh"],
      lichTrinh: json["lichTrinh"],
      idTuyenDuong: json["idTuyenDuong"] ?? 0,
      idNhaXe: json["idNhaXe"] ?? 0,
      tenNhaXe: json["tenNhaXe"] ?? "",
      loaiXe: json["loaiXe"] ?? "",
      idLoaiXe: json["idLoaiXe"] ?? 0,
      giaVe: json["giaVe"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "idLichChayXe": idLichChayXe,
        "gioDi": gioDi,
        "gioDen": gioDen,
        "tenTuyenDuong": tenTuyenDuong,
        "thoiGianHanhTrinh": thoiGianHanhTrinh,
        "lichTrinh": lichTrinh,
        "idTuyenDuong": idTuyenDuong,
        "idNhaXe": idNhaXe,
        "tenNhaXe": tenNhaXe,
        "loaiXe": loaiXe,
        "idLoaiXe": idLoaiXe,
        "giaVe": giaVe,
      };
}

class ThongTinTuyenDuong {
  ThongTinTuyenDuong({
    required this.idLichChayXe,
    required this.idChang,
    required this.tenChang,
    required this.thoiGianDi,
    required this.tenTuyenDuong,
    required this.thoiGianHanhTrinh,
    required this.lichTrinh,
    required this.idTuyenDuong,
    required this.idNhaXe,
    required this.tenNhaXe,
    required this.loaiXe,
    required this.giaVe,
    required this.idVanPhongDon,
    required this.idVanPhongTra,
    required this.tenGhe,
  });

  final int idLichChayXe;
  final int idChang;
  final String tenChang;
  final String thoiGianDi;
  final String tenTuyenDuong;
  final dynamic thoiGianHanhTrinh;
  final dynamic lichTrinh;
  final int idTuyenDuong;
  final int idNhaXe;
  final String tenNhaXe;
  final String loaiXe;
  final double giaVe;
  final int idVanPhongDon;
  final int idVanPhongTra;
  final String tenGhe;

  factory ThongTinTuyenDuong.fromJson(Map<String, dynamic> json) {
    return ThongTinTuyenDuong(
      idLichChayXe: json["idLichChayXe"] ?? 0,
      idChang: json["idChang"] ?? 0,
      tenChang: json["tenChang"] ?? "",
      thoiGianDi: json["thoiGianDi"] ?? "",
      tenTuyenDuong: json["tenTuyenDuong"] ?? "",
      thoiGianHanhTrinh: json["thoiGianHanhTrinh"],
      lichTrinh: json["lichTrinh"],
      idTuyenDuong: json["idTuyenDuong"] ?? 0,
      idNhaXe: json["idNhaXe"] ?? 0,
      tenNhaXe: json["tenNhaXe"] ?? "",
      loaiXe: json["loaiXe"] ?? "",
      giaVe: json["giaVe"] ?? 0,
      idVanPhongDon: json["idVanPhongDon"] ?? 0,
      idVanPhongTra: json["idVanPhongTra"] ?? 0,
      tenGhe: json["tenGhe"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "idLichChayXe": idLichChayXe,
        "idChang": idChang,
        "tenChang": tenChang,
        "thoiGianDi": thoiGianDi,
        "tenTuyenDuong": tenTuyenDuong,
        "thoiGianHanhTrinh": thoiGianHanhTrinh,
        "lichTrinh": lichTrinh,
        "idTuyenDuong": idTuyenDuong,
        "idNhaXe": idNhaXe,
        "tenNhaXe": tenNhaXe,
        "loaiXe": loaiXe,
        "giaVe": giaVe,
        "idVanPhongDon": idVanPhongDon,
        "idVanPhongTra": idVanPhongTra,
        "tenGhe": tenGhe,
      };
}
