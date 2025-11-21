class BookTicketModel {
  BookTicketModel({
    required this.idNhaXe,
    required this.hoTen,
    required this.dienThoai,
    required this.diaChiKhachDi,
    required this.diaChiKhachDen,
    required this.tienCocVe,
    required this.khachTcDon,
    required this.khachTcTra,
    required this.idNhaTcDon,
    required this.idNhaTcTra,
    required this.isVeTangCuong,
    required this.idChang,
    required this.idVanPhongDon,
    required this.idVanPhongTra,
    required this.daThanhToan,
    required this.ghiChu,
    required this.chiTietGhes,
    required this.nguoiTao,
    required this.loaiDatVe,
    required this.idNhanVienPhucVu,
    required this.thoiGianDatVe,
    required this.yeuCauXuatHoaDon,
    required this.thongTinHoaDon,
    required this.ngayChay,
    required this.idLichChayXe,
    required this.doman,
    required this.ip,
    required this.deVice,
  });

  final int idNhaXe;
  final String hoTen;
  final String dienThoai;
  final String diaChiKhachDi;
  final String diaChiKhachDen;
  final int tienCocVe;
  final bool khachTcDon;
  final bool khachTcTra;
  final dynamic idNhaTcDon;
  final dynamic idNhaTcTra;
  final bool isVeTangCuong;
  final int idChang;
  final int idVanPhongDon;
  final int idVanPhongTra;
  final bool daThanhToan;
  final String ghiChu;
  final List<ChiTietGhe> chiTietGhes;
  final String? nguoiTao;
  final int loaiDatVe;
  final String idNhanVienPhucVu;
  final DateTime? thoiGianDatVe;
  final bool yeuCauXuatHoaDon;
  final dynamic thongTinHoaDon;
  final DateTime? ngayChay;
  final int idLichChayXe;
  final String doman;
  final String ip;
  final String deVice;

  factory BookTicketModel.fromJson(Map<String, dynamic> json){
    return BookTicketModel(
      idNhaXe: json["idNhaXe"] ?? 0,
      hoTen: json["hoTen"] ?? "",
      dienThoai: json["dienThoai"] ?? "",
      diaChiKhachDi: json["diaChiKhachDi"] ?? "",
      diaChiKhachDen: json["diaChiKhachDen"] ?? "",
      tienCocVe: json["tienCocVe"] ?? 0,
      khachTcDon: json["khachTCDon"] ?? false,
      khachTcTra: json["khachTCTra"] ?? false,
      idNhaTcDon: json["idNhaTCDon"],
      idNhaTcTra: json["idNhaTCTra"],
      isVeTangCuong: json["isVeTangCuong"] ?? false,
      idChang: json["idChang"] ?? 0,
      idVanPhongDon: json["idVanPhongDon"] ?? 0,
      idVanPhongTra: json["idVanPhongTra"] ?? 0,
      daThanhToan: json["daThanhToan"] ?? false,
      ghiChu: json["ghiChu"] ?? "",
      chiTietGhes: json["chiTietGhes"] == null ? [] : List<ChiTietGhe>.from(json["chiTietGhes"]!.map((x) => ChiTietGhe.fromJson(x))),
      nguoiTao: json["nguoiTao"] ?? "",
      loaiDatVe: json["loaiDatVe"] ?? 0,
      idNhanVienPhucVu: json["idNhanVienPhucVu"] ?? "",
      thoiGianDatVe: DateTime.tryParse(json["thoiGianDatVe"] ?? ""),
      yeuCauXuatHoaDon: json["yeuCauXuatHoaDon"] ?? false,
      thongTinHoaDon: json["thongTinHoaDon"],
      ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
      idLichChayXe: json["idLichChayXe"] ?? 0,
      doman: json["doman"] ?? "",
      ip: json["ip"] ?? "",
      deVice: json["deVice"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "idNhaXe": idNhaXe,
    "hoTen": hoTen,
    "dienThoai": dienThoai,
    "diaChiKhachDi": diaChiKhachDi,
    "diaChiKhachDen": diaChiKhachDen,
    "tienCocVe": tienCocVe,
    "khachTCDon": khachTcDon,
    "khachTCTra": khachTcTra,
    "idNhaTCDon": idNhaTcDon,
    "idNhaTCTra": idNhaTcTra,
    "isVeTangCuong": isVeTangCuong,
    "idChang": idChang,
    "idVanPhongDon": idVanPhongDon,
    "idVanPhongTra": idVanPhongTra,
    "daThanhToan": daThanhToan,
    "ghiChu": ghiChu,
    "chiTietGhes": chiTietGhes.map((x) => x?.toJson()).toList(),
    "nguoiTao": nguoiTao,
    "loaiDatVe": loaiDatVe,
    "idNhanVienPhucVu": idNhanVienPhucVu,
    "thoiGianDatVe": thoiGianDatVe?.toIso8601String(),
    "yeuCauXuatHoaDon": yeuCauXuatHoaDon,
    "thongTinHoaDon": thongTinHoaDon,
    "ngayChay": ngayChay?.toIso8601String(),
    "idLichChayXe": idLichChayXe,
    "doman": doman,
    "ip": ip,
    "deVice": deVice,
  };

}

class ChiTietGhe {
  ChiTietGhe({
    required this.tang,
    required this.hang,
    required this.day,
    required this.giaVe,
    required this.diemBan,
    required this.tenGhe,
  });

  final int tang;
  final int hang;
  final int day;
  final int giaVe;
  final int diemBan;
  final String tenGhe;

  factory ChiTietGhe.fromJson(Map<String, dynamic> json){
    return ChiTietGhe(
      tang: json["tang"] ?? 0,
      hang: json["hang"] ?? 0,
      day: json["day"] ?? 0,
      giaVe: json["giaVe"] ?? 0,
      diemBan: json["diemBan"] ?? 0,
      tenGhe: json["tenGhe"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "tang": tang,
    "hang": hang,
    "day": day,
    "giaVe": giaVe,
    "diemBan": diemBan,
    "tenGhe": tenGhe,
  };

}
