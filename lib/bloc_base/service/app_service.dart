import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/models/response/app/tong_diem_response.dart';

class AppService extends BaseRepository {



  Future<TongDiemResponse?> getTongDiem(int idNhaXe) async {
    final response = await baseCallApi(
      "/api/v1/manage/tai-khoan/diem-thuong",
      EnumRequestMethod.get,
      jsonMap: {"idNhaXe": idNhaXe},
    );

    if (response is Map<String, dynamic>) {
      final data = response['data'];
      if (data is Map<String, dynamic>) {
        return TongDiemResponse.fromJson(data);
      }
    }

    return null;
  }
}