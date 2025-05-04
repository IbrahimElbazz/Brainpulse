import 'package:dio/dio.dart';

class AuthApiService {
  final String _baseUrl = "https://manoehab-001-site1.ltempurl.com/api/";
  Dio dio;
  AuthApiService({required this.dio});
  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    var response = await dio.post("$_baseUrl$endpoint",
        data: data,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    return response.data;
  }
}
