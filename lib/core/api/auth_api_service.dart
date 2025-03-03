import 'package:dio/dio.dart';

class AuthApiService {
  final String _baseUrl = "http://brain-pulse.runasp.net/api/";
  Dio dio;
  AuthApiService({required this.dio});
  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    var response = await dio.post("$_baseUrl$endpoint", data: data);
    return response.data;
  }
}
