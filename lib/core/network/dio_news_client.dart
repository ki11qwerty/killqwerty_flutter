import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:killqwerty_flutter/core/constants/env.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('🚀 REQUEST[${options.method}] => PATH: ${options.path}');
      print('📋 Headers: ${options.headers}');
      print('🔍 Query Parameters: ${options.queryParameters}');
      if (options.data != null) {
        print('📦 Request Body: ${options.data}');
      }
      print('🌐 Full URL: ${options.uri}');
      print('⏱️  Timeout: Connect=${options.connectTimeout}, Receive=${options.receiveTimeout}');
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    }
    options.extra['start_time'] = DateTime.now().millisecondsSinceEpoch;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print('📋 Response Headers: ${response.headers}');
      print('📊 Response Data Type: ${response.data.runtimeType}');

      if (response.data is Map || response.data is List) {
        final dataString = response.data.toString();
        if (dataString.length >= 500) {
          print('📦 Response Body: [Large response - ${dataString.length} characters]');
          print('📦 Response Preview: ${dataString.substring(0, 500)}...');
        } else {
          print('📦 Response Body: ${response.data}');
        }
      } else if (response.data is String) {
        if(response.data.length < 500) {
          print('📦 Response Body: ${response.data}');
        }else{
          print('📦 Response Body: [Large response - ${response.data.length} characters]');
          print('📦 Response Preview: ${response.data.substring(0, 500)}...');
        }
      } else {
        print('📦 Response Body: [Large response - ${response.data.toString().length} characters]');
      }
      
      final startTime = response.requestOptions.extra['start_time'] as int?;
      if (startTime != null) {
        print('⏱️  Response Time: ${DateTime.now().millisecondsSinceEpoch - startTime}ms');
      }
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('❌ ERROR[${err.response?.statusCode ?? 'NO_STATUS'}] => PATH: ${err.requestOptions.path}');
      print('🚨 Error Type: ${err.type}');
      print('💬 Error Message: ${err.message}');
      
      if (err.response != null) {
        print('📋 Error Response Headers: ${err.response!.headers}');
        print('📦 Error Response Data: ${err.response!.data}');
      }
      
      final startTime = err.requestOptions.extra['start_time'] as int?;
      if (startTime != null) {
        print('⏱️  Error Time: ${DateTime.now().millisecondsSinceEpoch - startTime}ms');
      }
      
      print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
    }
    super.onError(err, handler);
  }
}

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
          options.headers['Content-Type'] = 'application/json';
          handler.next(options);
        },
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(LoggingInterceptor());
    }
  }

  Future get(String path, {Map<String, dynamic>? queryParameters, Options? options, CancelToken? cancelToken}) async {
    final mergedQueryParameters = <String, dynamic>{};
    if (queryParameters != null) {
      mergedQueryParameters.addAll(queryParameters);
    }
     mergedQueryParameters['apikey'] = Env.newsKey;

    return _dio.get(
      path,
      queryParameters: mergedQueryParameters,
      options: options,
      cancelToken: cancelToken,
    );
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
