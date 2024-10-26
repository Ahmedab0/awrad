import 'dart:developer';

import 'package:awrad/core/utils/constant.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  final Constant _const = Constant();


  // get Method
  Future get({required String endPoint, Map<String, dynamic>? queryParams}) async {
    //saveToken('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2F3cmFkYXBwLmNvbS9hcGkvbG9naW4iLCJpYXQiOjE3Mjc4OTc5NTMsImV4cCI6MTcyNzkwMTU1MywibmJmIjoxNzI3ODk3OTUzLCJqdGkiOiI4ZUpqTnZNb1hoOEJPZ0tUIiwic3ViIjoiMSIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.TEtgUKUyYKdRyXeYfRf3AR_OcvpYc3C18QFzAZ2t9oc');

    // Retrieve the token from secure storage
    /*  String? token = await getToken();
    if (token == null) {
      log('Token not found');
      throw Exception('Token not found');
    }*/
   /* Map<String, dynamic> headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vYXdyYWRhcHAuY29tL2FwaS9sb2dpbiIsImlhdCI6MTcyOTUzOTI4MiwiZXhwIjoxNzI5NTQyODgyLCJuYmYiOjE3Mjk1MzkyODIsImp0aSI6IlJhblhtOGZtcVlhTklSVmQiLCJzdWIiOiIxIiwicHJ2IjoiNDFlZmI3YmFkN2Y2ZjYzMmUyNDA1YmQzYTc5M2I4YTZiZGVjNjc3NyJ9._CdSM61BNPU9ZMfKniW1CXPAjCPY3gKPZuS-3PlzJLY',
    };*/
    try {
      final Response response = await _dio.get(
        '${_const.baseUrl}$endPoint',
        queryParameters: queryParams,
        //options: Options(headers: headers),
      );
      if (response.statusCode == 200 && response.data['key'] == 'success') {
        return response.data;
      } else {
        log('print:- ${response.data["msg"]}');
      }
    } catch (e) {
      log('Error occurred:- $e');
      //throw Exception(e);
      rethrow;
    }
  }

  // post categories details Method
  Future post({required String endPoint, required Map<String, dynamic> body}) async {
    // saveToken('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2F3cmFkYXBwLmNvbS9hcGkvbG9naW4iLCJpYXQiOjE3Mjc1NTAwMzUsImV4cCI6MTcyNzU1MzYzNSwibmJmIjoxNzI3NTUwMDM1LCJqdGkiOiJSRmQ5VHBlYlJ3Z1ZReTFFIiwic3ViIjoiMSIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.Xe93Bt-Ox930Angxm_t4F6g6ibLhVDsOYSt279vsvGM');
    // Retrieve the token from secure storage
/*    String? token = await getToken();
    if (token == null) {
      log('Token not found');
      throw Exception('Token not found');
    }*/
   /* Map<String, dynamic> headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vYXdyYWRhcHAuY29tL2FwaS9sb2dpbiIsImlhdCI6MTcyOTUzOTI4MiwiZXhwIjoxNzI5NTQyODgyLCJuYmYiOjE3Mjk1MzkyODIsImp0aSI6IlJhblhtOGZtcVlhTklSVmQiLCJzdWIiOiIxIiwicHJ2IjoiNDFlZmI3YmFkN2Y2ZjYzMmUyNDA1YmQzYTc5M2I4YTZiZGVjNjc3NyJ9._CdSM61BNPU9ZMfKniW1CXPAjCPY3gKPZuS-3PlzJLY',
    };*/
    try {
      final Response response = await _dio.post('${_const.baseUrl}$endPoint',
         // options: Options(headers: headers),
          data: body);
      if (response.statusCode == 200  && response.data['key'] == 'success') {
        return response.data;
      } else {
        return response.data['msg'];
      }
    } catch (e) {
      log('Error occurred: $e');
      //throw Exception(e);
      rethrow;
    }
  }

  // dio helper
  Dio createSetupDio() {
    Dio dio = Dio();
    /*_dio
      ..options.connectTimeout = const Duration(seconds: 10)
      ..options.receiveTimeout = const Duration(seconds: 10);*/
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true));
    return dio;
  }
}
