import 'package:timos_customer_2025/base_api/base_repository.dart';

class AppService extends BaseRepository {



  Future<int> getTongDiem(int idNhaXe) async {
    var response = await baseCallApi(
      "/api/v1/manage/diem-thuong",
      "GET",
      jsonMap: {"idNhaXe": idNhaXe},
    );

    print("Data $response");
    return 1;
  }
}