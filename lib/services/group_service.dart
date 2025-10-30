import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/models/network/group/group_request.dart';
import 'package:timos_customer_2025/models/response/group/group_response.dart';

class GroupService extends BaseRepository {
  static final GroupService _instance = GroupService._internal();
  
  factory GroupService() => _instance;
  GroupService._internal();

  /// Lấy danh sách nhóm nội bộ và nhóm công khai
  Future<GroupListResponse> getGroupList({required String ngayChay}) async {
    try {
      final request = GroupListRequest(ngayChay: ngayChay);
      
      final response = await baseCallApi(
        '/api/v1/vanglai/danh-sach-nhom',
        EnumRequestMethod.post,
        jsonMap: request.toJson(),
        isToken: true,
      );
      return GroupListResponse.fromJson(response);
    } catch (e) {
      throw Exception('Lỗi khi lấy danh sách nhóm: $e');
    }
  }

  /// Lấy danh sách nhóm nội bộ
  Future<List<GroupItem>> getInternalGroups({required String ngayChay}) async {
    final response = await getGroupList(ngayChay: ngayChay);
    
    if (response.isSuccess && response.data != null) {
      return response.data!.where((group) => group.isInternalGroup).toList();
    }
    
    return [];
  }

  /// Lấy danh sách nhóm công khai
  Future<List<GroupItem>> getPublicGroups({required String ngayChay}) async {
    final response = await getGroupList(ngayChay: ngayChay);
    
    if (response.isSuccess && response.data != null) {
      return response.data!.where((group) => group.isPublicGroup).toList();
    }
    
    return [];
  }
}