import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timos_customer_2025/const/const.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';

class BaseApi {
  static Dio dio = getBaseDio();
  final box = GetStorage();

  static Dio getBaseDio() {
    Dio dio = Dio();

    dio.options = buildDefaultOptions();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
    return dio;
  }

  static BaseOptions buildDefaultOptions({Duration? timeOut}) {
    return BaseOptions()
      ..connectTimeout = timeOut ?? const Duration(milliseconds: 1500)
      ..receiveTimeout = timeOut ?? const Duration(milliseconds: 1500);
  }

  // // Khi nào cần lắng nghe lỗi từ BaseApi thì gọi hàm này
  // void setOnErrorListener(Function(Object error) onErrorCallBack) {
  //   this.onErrorCallBack = onErrorCallBack;
  // }
  //
  // late Function(Object error) onErrorCallBack;

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> callApi(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    BaseOptions? dioOptions,
    Function(Object error)? functionError,
    bool isToken = true,
    Duration? timeOut,
  }) async {
    dio.options = dioOptions ?? buildDefaultOptions(timeOut: timeOut);
    dynamic response;

    String url = urlOther ?? (Const.HOST_URL + action);

    Map<String, String> headers = isToken
        ? (headersUrlOther ?? await getBaseHeader())
        : {"Content-Type": "application/json"};

    Options options = isDownload
        ? Options(
            headers: headers,
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            })
        : Options(
            headers: headers,
            responseType: ResponseType.json,
          );
    CancelToken cancelToken = CancelToken();

    try {
      if (requestMethod == EnumRequestMethod.post) {
        if (isQueryParametersPost) {
          response = await dio.post(
            url,
            queryParameters: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        } else {
          response = await dio.post(
            url,
            data: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        }
      } else if (requestMethod == EnumRequestMethod.delete) {
        response = await dio.delete(
          url,
          data: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (requestMethod == EnumRequestMethod.put) {
        response = await dio.put(
          url,
          data: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      } else {
        response = await dio.get(
          url,
          queryParameters: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      }
      return response.data;
    } catch (e) {
      return functionError != null ? functionError(e) : showDialogError(e);
    }
  }

  dynamic showDialogError(dynamic e) {
    if (e.response?.data != null &&
        e.response.data is Map &&
        e.response.data["errorMessage"] != null) {
      return e.response.data;
    }
    // onErrorCallBack(e);
    // Re-throw the exception if we can't handle it
    throw e;
  }

  Future<Map<String, String>> getBaseHeader() async {
    final accessToken = box.read(Const.ACCESS_TOKEN);
    return {
      "Content-Type": "application/json",
      'Authorization': "Bearer $accessToken",
    };
  }
}
