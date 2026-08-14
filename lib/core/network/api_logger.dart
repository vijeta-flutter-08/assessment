import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiLogger extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final method = options.method.toUpperCase();
    final uri = options.uri;

    debugPrint(
      '── REQUEST ─────────────────────────────────────────\n'
      '$method ${uri.toString()}\n'
      'Query Params: ${options.queryParameters}\n'
      'Headers: ${options.headers}\n'
      'Body: ${options.data}',
    );

    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final statusCode = response.statusCode;
    final method = response.requestOptions.method.toUpperCase();
    final uri = response.requestOptions.uri;

    debugPrint(
      '── RESPONSE ───────────────────────────────────────\n'
      '$method ${uri.toString()}\n'
      'Status: $statusCode\n'
      'Body: ${response.data}',
    );

    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    final statusCode = err.response?.statusCode;
    final method = err.requestOptions.method.toUpperCase();
    final uri = err.requestOptions.uri;

    debugPrint(
      '── ERROR ──────────────────────────────────────────\n'
      '$method ${uri.toString()}\n'
      'Status: ${statusCode ?? 'N/A'}\n'
      'Type: ${err.type}\n'
      'Message: ${err.message}\n'
      'Response Body: ${err.response?.data}',
    );

    handler.next(err);
  }
}
