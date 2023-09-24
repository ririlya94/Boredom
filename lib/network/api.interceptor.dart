import 'package:boredom/enum/enum.logger.dart';
import 'package:boredom/utilities/app_log.dart';
import 'package:dio/dio.dart';

/// this is an interceptor for base api
/// to ease and check if anything goes wrong with api calling/fetching/getting/error
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLog.print('REQUEST[${options.method}] => PATH: ${options.path}',level: LoggerLevel.debug);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLog.print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}', level: LoggerLevel.verbose);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException exc, ErrorInterceptorHandler handler) {
    AppLog.print('ERROR[${exc.response?.statusCode}] => PATH: ${exc.requestOptions.path}', level: LoggerLevel.error);
    return super.onError(exc, handler);
  }
}