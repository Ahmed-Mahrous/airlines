import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://www.kayak.com';
  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
