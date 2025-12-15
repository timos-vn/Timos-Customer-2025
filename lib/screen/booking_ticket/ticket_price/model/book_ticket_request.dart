class BookTicketRequest {
  BookTicketRequest({
    required this.idNhaXe,
    required this.hoTen,
    required this.dienThoai,
    required this.diaChiKhachDi,
    required this.diaChiKhachDen,
    required this.idLichXe,
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
    required this.domain,
    required this.ip,
    required this.deVice,
    required this.ipClient,
  });

  final int? idNhaXe;
  final String? hoTen;
  final String? dienThoai;
  final String? diaChiKhachDi;
  final String? diaChiKhachDen;
  final String? idLichXe;
  final int? tienCocVe;
  final bool? khachTcDon;
  final bool? khachTcTra;
  final dynamic idNhaTcDon;
  final dynamic idNhaTcTra;
  final bool? isVeTangCuong;
  final int? idChang;
  final dynamic idVanPhongDon;
  final dynamic idVanPhongTra;
  final bool? daThanhToan;
  final String? ghiChu;
  final List<ChiTietGhe> chiTietGhes;
  final String? nguoiTao;
  final int? loaiDatVe;
  final dynamic idNhanVienPhucVu;
  final DateTime? thoiGianDatVe;
  final bool? yeuCauXuatHoaDon;
  final dynamic thongTinHoaDon;
  final DateTime? ngayChay;
  final int? idLichChayXe;
  final String? domain;
  final String? ip;
  final String? deVice;
  final String? ipClient;

  factory BookTicketRequest.fromJson(Map<String, dynamic> json){
    return BookTicketRequest(
      idNhaXe: json["idNhaXe"],
      hoTen: json["hoTen"],
      dienThoai: json["dienThoai"],
      diaChiKhachDi: json["diaChiKhachDi"],
      diaChiKhachDen: json["diaChiKhachDen"],
      idLichXe: json["idLichXe"],
      tienCocVe: json["tienCocVe"],
      khachTcDon: json["khachTCDon"],
      khachTcTra: json["khachTCTra"],
      idNhaTcDon: json["idNhaTCDon"],
      idNhaTcTra: json["idNhaTCTra"],
      isVeTangCuong: json["isVeTangCuong"],
      idChang: json["idChang"],
      idVanPhongDon: json["idVanPhongDon"],
      idVanPhongTra: json["idVanPhongTra"],
      daThanhToan: json["daThanhToan"],
      ghiChu: json["ghiChu"],
      chiTietGhes: json["chiTietGhes"] == null ? [] : List<ChiTietGhe>.from(json["chiTietGhes"]!.map((x) => ChiTietGhe.fromJson(x))),
      nguoiTao: json["nguoiTao"],
      loaiDatVe: json["loaiDatVe"],
      idNhanVienPhucVu: json["idNhanVienPhucVu"],
      thoiGianDatVe: DateTime.tryParse(json["thoiGianDatVe"] ?? ""),
      yeuCauXuatHoaDon: json["yeuCauXuatHoaDon"],
      thongTinHoaDon: json["thongTinHoaDon"],
      ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
      idLichChayXe: json["idLichChayXe"],
      domain: json["domain"],
      ip: json["ip"],
      deVice: json["device"],
      ipClient: json["ipClient"],
    );
  }

  Map<String, dynamic> toJson() => {
    "idNhaXe": idNhaXe,
    "hoTen": hoTen,
    "dienThoai": dienThoai,
    "diaChiKhachDi": diaChiKhachDi,
    "diaChiKhachDen": diaChiKhachDen,
    "idLichXe": idLichXe,
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
    "domain": domain,
    "ip": ip,
    "device": deVice,
    "ipClient": ipClient,
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

  final int? tang;
  final int? hang;
  final int? day;
  final int? giaVe;
  final int? diemBan;
  final String? tenGhe;

  factory ChiTietGhe.fromJson(Map<String, dynamic> json){
    return ChiTietGhe(
      tang: json["tang"],
      hang: json["hang"],
      day: json["day"],
      giaVe: json["giaVe"],
      diemBan: json["diemBan"],
      tenGhe: json["tenGhe"],
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

class GhesDatCho {
  GhesDatCho({
    required this.tang,
    required this.hang,
    required this.day,
    required this.tenGhe,
  });

  final int? tang;
  final int? hang;
  final int? day;
  final String? tenGhe;

  factory GhesDatCho.fromJson(Map<String, dynamic> json){
    return GhesDatCho(
      tang: json["Tang"],
      hang: json["Hang"],
      day: json["Day"],
      tenGhe: json["TenGhe"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Tang": tang,
    "Hang": hang,
    "Day": day,
    "TenGhe": tenGhe,
  };
}
