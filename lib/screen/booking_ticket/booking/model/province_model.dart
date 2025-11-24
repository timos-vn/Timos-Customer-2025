class ProvinceModel {
  final String maTP;
  final String tenThanhPho;
  final String loai;

  ProvinceModel({required this.maTP, required this.tenThanhPho, required this.loai});

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      maTP: json['maTP'] as String,
      tenThanhPho: json['tenThanhPho'] as String,
      loai: json['loai'] as String,
    );
  }
}
