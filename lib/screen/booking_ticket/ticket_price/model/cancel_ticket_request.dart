class CancelTicketRequest {
  CancelTicketRequest({
    required this.idLichXe,
    required this.idKhachHang,
    required this.maDatCho,
    required this.ngayChay,
    required this.lyDoHuy,
    required this.nguoiHuy,
    required this.thoiGianHuy,
  });

  final String idLichXe;
  final String idKhachHang;
  final int maDatCho;
  final DateTime? ngayChay;
  final String lyDoHuy;
  final String nguoiHuy;
  final DateTime? thoiGianHuy;

  factory CancelTicketRequest.fromJson(Map<String, dynamic> json){
    return CancelTicketRequest(
      idLichXe: json["idLichXe"] ?? "",
      idKhachHang: json["idKhachHang"] ?? "",
      maDatCho: json["maDatCho"] ?? 0,
      ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
      lyDoHuy: json["lyDoHuy"] ?? "",
      nguoiHuy: json["nguoiHuy"] ?? "",
      thoiGianHuy: DateTime.tryParse(json["thoiGianHuy"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "idLichXe": idLichXe,
    "idKhachHang": idKhachHang,
    "maDatCho": maDatCho,
    "ngayChay": ngayChay?.toIso8601String(),
    "lyDoHuy": lyDoHuy,
    "nguoiHuy": nguoiHuy,
    "thoiGianHuy": thoiGianHuy?.toIso8601String(),
  };

}
