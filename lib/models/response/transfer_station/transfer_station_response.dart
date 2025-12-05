class TransferStationResponse {
  final List<TransferStationItem> data;
  final int pageIndex;
  final int pageSize;
  final int totalRecords;
  final int pageCount;
  final int statusCode;
  final String message;

  TransferStationResponse({
    required this.data,
    required this.pageIndex,
    required this.pageSize,
    required this.totalRecords,
    required this.pageCount,
    required this.statusCode,
    required this.message,
  });

  factory TransferStationResponse.fromJson(Map<String, dynamic> json) {
    return TransferStationResponse(
      data: json["data"] == null
          ? []
          : List<TransferStationItem>.from(
              json["data"].map((x) => TransferStationItem.fromJson(x))),
      pageIndex: json["pageIndex"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      totalRecords: json["totalRecords"] ?? 0,
      pageCount: json["pageCount"] ?? 0,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "totalRecords": totalRecords,
        "pageCount": pageCount,
        "statusCode": statusCode,
        "message": message,
      };
}

class TransferStationItem {
  final bool disabled;
  final String? group;
  final bool selected;
  final String text;
  final String value;

  TransferStationItem({
    required this.disabled,
    this.group,
    required this.selected,
    required this.text,
    required this.value,
  });

  factory TransferStationItem.fromJson(Map<String, dynamic> json) {
    return TransferStationItem(
      disabled: json["disabled"] ?? false,
      group: json["group"],
      selected: json["selected"] ?? false,
      text: json["text"] ?? "",
      value: json["value"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "disabled": disabled,
        "group": group,
        "selected": selected,
        "text": text,
        "value": value,
      };
}

