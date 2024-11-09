import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<List<dynamic>> get(
      {required String endPoint, required String baseUrl}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
