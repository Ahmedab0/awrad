/*
import 'dart:developer';

import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio; // or final dio = Dio();
  ApiServices(this._dio);

  final String baseUrl = 'https://www.googleapis.com/books/v1/';

  Future get({required String endPoint}) async {
    final response = await _dio.get('$baseUrl$endPoint');
    //log(response.data.toString());
    return response.data;
  }
}
*/
