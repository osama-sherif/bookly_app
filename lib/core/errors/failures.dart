import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to Api was canceld');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure(
            'No internet connection , please try again later',
          );
        }
        return ServerFailure('Unexpected error , please try again');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.badCertificate:
        throw UnimplementedError();
    }
  }
  factory ServerFailure.fromResponse(
    int? statusCode,
    Map<String, dynamic> response,
  ) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found ,Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error ,Please try again later');
    } else {
      return ServerFailure('Opps there was an error ,Please try again');
    }
  }
}
