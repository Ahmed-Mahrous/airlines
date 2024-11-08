import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://www.kayak.com';
  final Dio _dio;

  ApiService(this._dio);

  Future<List<Map<String, dynamic>>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
