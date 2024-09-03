


import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  Failure({required this.errorMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMsg});

  factory ServerFailure.fromDioException(DioException dioExc) {

    switch(dioExc.type) {

      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMsg: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMsg: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMsg: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMsg: "Internal Server Error");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExc.response!.statusCode, dioExc.response!.data);
      case DioExceptionType.cancel:
      return ServerFailure(errorMsg: 'Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMsg: "No Internet Connection");
      case DioExceptionType.unknown:
      if (dioExc.message!.contains('SocketException')) {
        return ServerFailure(errorMsg: 'No Internet Connection: SocketException');
      } else {
        return ServerFailure(errorMsg: 'Unexpected Error, Please try again!');
      }
    default:
      return ServerFailure(errorMsg: 'Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMsg: response['msg']);
    } else if (statusCode == 404) {
      return ServerFailure(errorMsg: 'Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure(errorMsg:  'Internal Server error, Please try later');
    } else {
      return ServerFailure(errorMsg: 'Opps There was an Error, Please try again');
    }
  }

}

