import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? code;
  ApiException(this.message, {this.code});
  @override
  String toString() => 'ApiException(code: $code, message: $message)';
}
ApiException handleDioError(DioException error) {
  if (error.type == DioExceptionType.connectionTimeout ||
      error.type == DioExceptionType.sendTimeout ||
      error.type == DioExceptionType.receiveTimeout) {
    return ApiException('Connection timeout');
  } else if (error.type == DioExceptionType.badResponse) {
    final statusCode = error.response?.statusCode;
    final msg = extractMessage(error.response);
    return ApiException(msg ?? 'Received invalid status code: statusCode', code: statusCode);
  } else if (error.type == DioExceptionType.cancel) {
    return ApiException('Request was cancelled');
  } else if (error.type == DioExceptionType.unknown) {
    return ApiException('Unexpected error: {error.message}');
  } else {
    return ApiException('Unknown network error');
  }
}

String? extractMessage(Response? response) {
  try {
    final data = response?.data;
    if (data is Map && data['message'] != null) return data['message'].toString();
    if (data is String) return data;
  } catch (e) {}
  return null;
}