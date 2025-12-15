class TongHopResponse {
  final int? soLuongSanBay;
  final int? soLuongTC;
  final int? soLuongVe;
  final double? tongDoanhThu;
  final int? soLuongChuyen;

  const TongHopResponse({
    this.soLuongSanBay,
    this.soLuongTC,
    this.soLuongVe,
    this.tongDoanhThu,
    this.soLuongChuyen,
  });

  factory TongHopResponse.fromJson(Map<String, dynamic> json) {
    return TongHopResponse(
      soLuongSanBay: json['soluongSanBay'] as int?,
      soLuongTC: json['soluongTC'] as int?,
      soLuongVe: json['soluongve'] as int?,
      tongDoanhThu: (json['tongdoanhthu'] as num?)?.toDouble(),
      soLuongChuyen: json['soluongchuyen'] as int?,
    );
  }
}

class TongDiemResponse {
  final String? id;
  final String? tenDangNhap;
  final String? hoTen;
  final String? dienThoai;
  final int? diemThuong;
  final int? diemChuyen;
  final int? diemCanhBao;
  final int? idNhaXe;
  final String? tenNhaXe;
  final TongHopResponse? tongHopResponse;

  const TongDiemResponse({
    this.id,
    this.tenDangNhap,
    this.hoTen,
    this.dienThoai,
    this.diemThuong,
    this.diemChuyen,
    this.diemCanhBao,
    this.idNhaXe,
    this.tenNhaXe,
    this.tongHopResponse,
  });

  factory TongDiemResponse.fromJson(Map<String, dynamic> json) {
    final tongHop = json['tongHopResponse'];
    return TongDiemResponse(
      id: json['id'] as String?,
      tenDangNhap: json['tenDangNhap'] as String?,
      hoTen: json['hoTen'] as String?,
      dienThoai: json['dienThoai'] as String?,
      diemThuong: (json['diemThuong'] as num?)?.toInt(),
      diemChuyen: (json['diemChuyen'] as num?)?.toInt(),
      diemCanhBao: (json['diemCanhBao'] as num?)?.toInt(),
      idNhaXe: json['idNhaXe'] as int?,
      tenNhaXe: json['tenNhaXe'] as String?,
      tongHopResponse: tongHop is Map<String, dynamic>
          ? TongHopResponse.fromJson(tongHop)
          : null,
    );
  }
}

