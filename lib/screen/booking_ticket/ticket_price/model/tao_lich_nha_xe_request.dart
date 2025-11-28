class TaoLichNhaXeRequest {
  TaoLichNhaXeRequest({
    required this.idNhaXe,
    required this.ngayChay,
    required this.idTuyenDuong,
    required this.idLoaiXe,
    required this.ghiChu,
    required this.gioDi,
    required this.idLichChayXe,
  });

  final int idNhaXe;
  final DateTime? ngayChay;
  final int idTuyenDuong;
  final int idLoaiXe;
  final String ghiChu;
  final String gioDi;
  final int idLichChayXe;

  factory TaoLichNhaXeRequest.fromJson(Map<String, dynamic> json){
    return TaoLichNhaXeRequest(
      idNhaXe: json["idNhaXe"] ?? 0,
      ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
      idTuyenDuong: json["idTuyenDuong"] ?? 0,
      idLoaiXe: json["idLoaiXe"] ?? 0,
      ghiChu: json["ghiChu"] ?? "",
      gioDi: json["gioDi"] ?? "",
      idLichChayXe: json["idLichChayXe"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "idNhaXe": idNhaXe,
    "ngayChay": ngayChay?.toIso8601String(),
    "idTuyenDuong": idTuyenDuong,
    "idLoaiXe": idLoaiXe,
    "ghiChu": ghiChu,
    "gioDi": gioDi,
    "idLichChayXe": idLichChayXe,
  };

}
