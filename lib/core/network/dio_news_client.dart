import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioNewsClient {
  final Dio _dio;

  DioNewsClient({Dio? dio}) : _dio = dio ?? Dio(
            BaseOptions(
              baseUrl: 'https://newsapi.org/v2/',
              connectTimeout: const Duration(milliseconds: 15000),
              receiveTimeout: const Duration(milliseconds: 15000),
              responseType: ResponseType.json,
            ),
          ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Accept'] = 'application/json';
           if (kDebugMode) {
             print('REQUEST[${options.method}] => PATH: ${options.path}');
           }
          handler.next(options);
        },
        onResponse: (response, handler) {
           if (kDebugMode) {
             print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
           }
          handler.next(response);
        },
        onError: (DioException e, handler) {
           if (kDebugMode) {
             print('ERROR[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}');
           }
          handler.next(e);
        },
      ),
    );
  }

  Future get(String path, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    return _dio.get(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.post(path, data: data, queryParameters: queryParameters, options: options, cancelToken: cancelToken);
  }

  Dio get dio => _dio;
}
