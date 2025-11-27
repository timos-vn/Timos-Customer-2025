class CancelTicketResponse {
  CancelTicketResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  final bool data;
  final int statusCode;
  final String message;

  factory CancelTicketResponse.fromJson(Map<String, dynamic> json){
    return CancelTicketResponse(
      data: json["data"] ?? false,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
    "statusCode": statusCode,
    "message": message,
  };

}
