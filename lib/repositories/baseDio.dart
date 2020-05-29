import 'package:dio/dio.dart';

class CustomDio {
  Dio _dio;

  CustomDio() {
    _dio = Dio();
    _dio.options.baseUrl = "https://api.github.com/";
  }
  Dio get instance => _dio;
}
