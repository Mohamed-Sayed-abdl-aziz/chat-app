import 'dart:io';
import 'package:chat_app/core/network/resulet_api.dart';
import 'package:dio/dio.dart';

class ApiHandlerDioE {
  static Future<ResultApi<T>> execute<T>(Future<T> Function() action) async {
    try {
      final response = await action();
      return SuccessApi(response);
    } on Exception catch (e) {
      return ErrorApi(_handleError(e));
    }
  }

  static String _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout with API server";
        case DioExceptionType.sendTimeout:
          return "Send timeout in connection with API server";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout in connection with API server";
        case DioExceptionType.badCertificate:
          return "Internal Certificate Validation Error";
        case DioExceptionType.connectionError:
          return "No Internet Connection";
        case DioExceptionType.badResponse:
          return _handleStatusCode(error.response?.statusCode);
        case DioExceptionType.cancel:
          return "Request to API server was cancelled";
        case DioExceptionType.unknown:
          if (error.error is SocketException) {
            return "Please check your internet connection";
          }
          return "Unexpected error occurred";
      }
    } else if (error is SocketException) {
      return "No Internet Connection";
    } else if (error is FormatException) {
      return "Bad response format from server";
    } else {
      return "Unknown error: ${error.toString()}";
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return "Bad request, please check your input";
      case 401:
        return "Unauthorized, please login again";
      case 403:
        return "Forbidden: You don't have permission";
      case 404:
        return "Resource not found";
      case 408:
        return "Request timeout, try again";
      case 409:
        return "Conflict occurred during the request";
      case 500:
        return "Internal Server Error, please try later";
      case 502:
        return "Bad gateway";
      case 503:
        return "Service unavailable";
      case 504:
        return "Gateway timeout";
      default:
        return "Received invalid status code: $statusCode";
    }
  }
}
