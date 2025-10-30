import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_request.freezed.dart';
part 'group_request.g.dart';

@freezed
class GroupListRequest with _$GroupListRequest {
  const factory GroupListRequest({
    required String ngayChay,
  }) = _GroupListRequest;

  factory GroupListRequest.fromJson(Map<String, dynamic> json) =>
      _$GroupListRequestFromJson(json);
}