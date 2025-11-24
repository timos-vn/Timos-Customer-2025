class BookTicketResponse {
  BookTicketResponse({
    required this.data,
    required this.statusCode,
    required this.message,
  });

  final bool data;
  final int statusCode;
  final String message;

  factory BookTicketResponse.fromJson(Map<String, dynamic> json){
    return BookTicketResponse(
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
