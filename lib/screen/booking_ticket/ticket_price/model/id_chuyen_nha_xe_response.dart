class IdChuyenDiResponse {
  IdChuyenDiResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  final String data;
  final int statusCode;
  final dynamic message;

  factory IdChuyenDiResponse.fromJson(Map<String, dynamic> json){
    return IdChuyenDiResponse(
      data: json["data"] ?? "",
      statusCode: json["statusCode"] ?? 0,
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
    "statusCode": statusCode,
    "message": message,
  };

}
