import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_response.freezed.dart';
part 'group_response.g.dart';

@freezed
class GroupListResponse with _$GroupListResponse {
  const factory GroupListResponse({
    List<GroupItem>? data,
    @Default(0) int statusCode,
    String? message,
  }) = _GroupListResponse;

  factory GroupListResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupListResponseFromJson(json);
}

extension GroupListResponseX on GroupListResponse {
  bool get isSuccess => statusCode == 200 && data != null;
}

@freezed
class GroupItem with _$GroupItem {
  const factory GroupItem({
    @Default(0) int idNhom,
    @Default('') String maNhom,
    @Default('') String tenNhom,
    @Default(0) int isPublic,
  }) = _GroupItem;

  factory GroupItem.fromJson(Map<String, dynamic> json) =>
      _$GroupItemFromJson(json);
}

extension GroupItemX on GroupItem {
  bool get isPublicGroup => isPublic == 1;
  bool get isInternalGroup => isPublic == 0;
  
  String get groupType => isPublicGroup ? 'Nhóm công khai' : 'Nhóm nội bộ';
}