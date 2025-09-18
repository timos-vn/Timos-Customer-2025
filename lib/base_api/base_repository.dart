import 'package:dio/dio.dart';
import 'package:timos_customer_2025/base_api/base_api.dart';

class BaseRepository {
  final BaseApi _baseApi = BaseApi();

  BaseRepository();

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> baseCallApi(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    BaseOptions? dioOptions,
    bool isToken = true,
    Function(Object error)? functionError,
    Duration? timeOut,
  }) {
    return _baseApi.callApi(
      action,
      requestMethod,
      jsonMap: jsonMap,
      isDownload: isDownload,
      urlOther: urlOther,
      headersUrlOther: headersUrlOther,
      isQueryParametersPost: isQueryParametersPost,
      dioOptions: dioOptions,
      functionError: functionError,
      isToken: isToken,
      timeOut: timeOut,
    );
  }
}
