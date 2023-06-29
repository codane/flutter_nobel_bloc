import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String exceptionMessage;

  DioExceptions.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        exceptionMessage = "Request to API server was cancelled";
        break;
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          exceptionMessage = 'No Internet';
          break;
        }
        exceptionMessage = "Unexpected error occurred";
        break;
      default:
        exceptionMessage = "Something went wrong";
        break;
    }
  }

  @override
  String toString() => exceptionMessage;
}