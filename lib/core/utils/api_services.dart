

import 'dart:developer';

import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio; // or final dio = Dio();
  ApiServices(this._dio);

  final String baseUrl = 'http://127.0.0.1:8000/api/';

  Future get({required String endPoint}) async {
    /*Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }*/
    final response = await _dio.get('$baseUrl$endPoint');
    log('response = ${response.data}');
    return response.data;
  }
}

