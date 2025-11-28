class BookTicketUpdateRequest {
  BookTicketUpdateRequest({
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
    required this.doman,
    required this.ip,
    required this.deVice,
    required this.ipClient,
    this.maDatCho,
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
  final List<ChiTietGheUpdate> chiTietGhes;
  final String? nguoiTao;
  final int? loaiDatVe;
  final dynamic idNhanVienPhucVu;
  final DateTime? thoiGianDatVe;
  final bool? yeuCauXuatHoaDon;
  final dynamic thongTinHoaDon;
  final DateTime? ngayChay;
  final int? idLichChayXe;
  final String? doman;
  final String? ip;
  final String? deVice;
  final String? ipClient;
  final int? maDatCho;

  factory BookTicketUpdateRequest.fromJson(Map<String, dynamic> json){
    return BookTicketUpdateRequest(
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
        chiTietGhes: json["chiTietGhes"] == null ? [] : List<ChiTietGheUpdate>.from(json["chiTietGhes"]!.map((x) => ChiTietGheUpdate.fromJson(x))),
        nguoiTao: json["nguoiTao"],
        loaiDatVe: json["loaiDatVe"],
        idNhanVienPhucVu: json["idNhanVienPhucVu"],
        thoiGianDatVe: DateTime.tryParse(json["thoiGianDatVe"] ?? ""),
        yeuCauXuatHoaDon: json["yeuCauXuatHoaDon"],
        thongTinHoaDon: json["thongTinHoaDon"],
        ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
        idLichChayXe: json["idLichChayXe"],
        doman: json["doman"],
        ip: json["ip"],
        deVice: json["deVice"],
        ipClient: json["ipClient"],
        maDatCho: json["maDatCho"]
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
    "doman": doman,
    "ip": ip,
    "deVice": deVice,
    "ipClient": ipClient,
    "maDatCho": maDatCho,
  };

}

class ChiTietGheUpdate {
  ChiTietGheUpdate({
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

  factory ChiTietGheUpdate.fromJson(Map<String, dynamic> json){
    return ChiTietGheUpdate(
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