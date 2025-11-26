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

  /// Prevent multiple logout triggers
  static bool _isLoggingOut = false;

  /// ---------------------------
  /// DIO SINGLETON
  /// ---------------------------
  static final Dio dio = getBaseDio()
    ..interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, handler) async {
          final statusCode = error.response?.statusCode;
          print("⚠️ Trạng thái lỗi: $statusCode");

          final context = navigatorKey.currentContext;

          // -------------------------------
          // TOKEN HẾT HẠN → LOGOUT 1 LẦN
          // -------------------------------
          if (statusCode == 401) {
            if (!_isLoggingOut) {
              _isLoggingOut = true;

              // show snack bar nếu còn context
              if (context != null) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
                    ),
                  ),
                );
              }

              // Đợi UI snack bar 200ms rồi mới logout
              await Future.delayed(const Duration(milliseconds: 200));

              navigatorKey.currentState?.pushNamedAndRemoveUntil(
                '/login',
                    (route) => false,
              );

              // reset flag sau khi màn login được mở
              Future.delayed(const Duration(milliseconds: 500), () {
                _isLoggingOut = false;
              });
            }

            return; // DỪNG, không bắn thêm handler
          }

          // -------------------------------
          // LỖI HỆ THỐNG CHUNG (1 lần)
          // -------------------------------
          if (context != null && statusCode != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Lỗi hệ thống, vui lòng thử lại sau! ($statusCode)',
                ),
              ),
            );
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
  /// KHÔNG ĐỤNG — GIỮ NGUYÊN
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
      return functionError != null ? functionError(e) : showDialogError(e);
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

    throw e; // Rethrow để interceptor bắt được
  }

  Future<Map<String, String>> getBaseHeader() async {
    final accessToken = box.read(Const.ACCESS_TOKEN);
    return {
      "Content-Type": "application/json",
      'Authorization': "Bearer $accessToken",
    };
  }
}


