import 'dart:async';
import 'dart:io';

import 'package:boredom/constant/constant.api.dart';
import 'package:boredom/network/api.interceptor.dart';
import 'package:dio/dio.dart';
import 'package:retry/retry.dart';

/// creating a base for api instance + with respective HTTP request method
/// using dio as base etc2
class Api {
  final Dio dio = Dio();
  static const String _baseUrl = ConstantApi.apiBaseUrl;

  Api() {
    dio.options
      ..responseType = ResponseType.json
      ..connectTimeout = ConstantApi.connectTimeout;

    dio.interceptors.addAll([ApiInterceptor()]);
  }

  /// GET
  Future<dynamic> get(String endpoint, {
    Map<String, dynamic>? queryParam,
    int? maxAttempts,
  }) async {

    final response = await retry(
          () => dio.getUri(Uri.https(_baseUrl, endpoint, queryParam))
              .timeout(ConstantApi.connectTimeout),
      retryIf: (e) => _retryLogic(e),
      maxAttempts: maxAttempts ?? ConstantApi.defaultMaxAttemptsAPI,
    );
    return response.data;
  }

  /// POST
  Future<Map<String, dynamic>> post(String endpoint, {
    dynamic body,
    int? maxAttempts,
    Map<String, String?>? headers,
    String? baseUrl,
  }) async {
    final response = await retry(
          () => dio.postUri(
            Uri.https(baseUrl ?? _baseUrl, endpoint),
            data: body,
            options: Options(
                headers: headers
            ),
          ).timeout(ConstantApi.connectTimeout),
      retryIf: (e) => _retryLogic(e),
      maxAttempts: maxAttempts ?? ConstantApi.defaultMaxAttemptsAPI,
    );
    return response.data;
  }

  /// what makes it to retry to call back on the respective HTTP request method
  bool _retryLogic(Exception e) {
    // true when it
    // IS socket OR timeout
    return e is SocketException ||
        e is TimeoutException;
  }
}