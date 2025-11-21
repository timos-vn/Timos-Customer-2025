class SeatingRequestModel {
  SeatingRequestModel({
    required this.idLichXe,
    required this.idLichXeChay,
    required this.idNhaXe,
    required this.idLoaiXe,
    required this.ngayChay,
  });

  final String idLichXe;
  final int idLichXeChay;
  final int idNhaXe;
  final int idLoaiXe;
  final String? ngayChay;

  // factory SeatingRequestModel.fromJson(Map<String, dynamic> json){
  //   return SeatingRequestModel(
  //     idLichXe: json["IdLichXe"] ?? "",
  //     idLichXeChay: json["IdLichXeChay"] ?? 0,
  //     idNhaXe: json["IdNhaXe"] ?? 0,
  //     idLoaiXe: json["idLoaiXe"] ?? 0,
  //     ngayChay: DateTime.tryParse(json["ngayChay"] ?? ""),
  //   );
  // }

  Map<String, dynamic> toJson() => {
    "IdLichXe": idLichXe,
    "IdLichXeChay": idLichXeChay,
    "IdNhaXe": idNhaXe,
    "idLoaiXe": idLoaiXe,
    "ngayChay": ngayChay,
  };

}
