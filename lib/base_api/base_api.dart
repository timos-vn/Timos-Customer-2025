import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_log_sds/interceptor/dio_log_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timos_customer_2025/const/const.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/utils/dio_log.dart';

import '../main.dart';

class BaseApi {

  static final BaseApi _instance = BaseApi._internal();
  factory BaseApi() => _instance;
  BaseApi._internal();

  final box = GetStorage();

  /// ---------------------------
  /// DIO SINGLETON
  /// ---------------------------
  static final Dio dio = getBaseDio()
    ..interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) {
          print("Trạng thái lỗi: ${error.response?.statusCode}");
          // Auto logout khi token hết hạn
          if (error.response?.statusCode == 401) {
            final context = navigatorKey.currentContext;
            if (context != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
                  ),
                ),
              );
            }
            navigatorKey.currentState?.pushNamedAndRemoveUntil(
              '/login',
                  (route) => false,
            );
          } else {
            final context = navigatorKey.currentContext;
            if (context != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Lỗi hệ thống vui lòng thử lại sau! (${error.response?.statusCode})',
                  ),
                ),
              );
            }
          }


          return handler.next(error);
        },
      ),
    );

  /// ---------------------------
  /// Build Dio
  /// ---------------------------
  static Dio getBaseDio() {
    final dio = Dio(buildDefaultOptions());

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    if (Diolog().showDebug) {
      dio.interceptors.add(SDSDioLogInterceptor());
    }
    return dio;
  }

  /// ---------------------------
  /// Default timeout
  /// ---------------------------
  static BaseOptions buildDefaultOptions({Duration? timeOut}) {
    return BaseOptions(
      connectTimeout: timeOut ?? const Duration(milliseconds: 1500),
      receiveTimeout: timeOut ?? const Duration(milliseconds: 1500),
    );
  }

  /// ---------------------------
  /// KHÔNG ĐỤNG GÌ TỚI HÀM NÀY
  /// CALL API GIỮ NGUYÊN 100%
  /// ---------------------------
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
      validateStatus: (status) => status != null && status < 500,
    )
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
      return functionError != null
          ? functionError(e)
          : showDialogError(e);
    }
  }

  /// ---------------------------
  /// KEEP NGUYÊN — KHÔNG ĐỔI
  /// ---------------------------
  dynamic showDialogError(dynamic e) {
    if (e.response?.data != null &&
        e.response.data is Map &&
        e.response.data["errorMessage"] != null) {
      return e.response.data;
    }

    // Quan trọng: RETHROW để interceptor nhận lỗi
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

