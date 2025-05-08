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

  Future<Map<String, dynamic>> postimage(
      {required String endpoint, required FormData data}) async {
    try {
      var response = await dio.post("$_baseUrl$endpoint",
          data: data,
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
          }));

      if (response.data is String) {
        try {
          return {"response": response.data};
        } catch (e) {
          throw Exception("Invalid JSON response: ${e.toString()}");
        }
      }

      return response.data;
    } catch (e) {
      throw Exception("Error during image POST request: ${e.toString()}");
    }
  }
}
