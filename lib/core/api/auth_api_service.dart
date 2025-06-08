import 'package:brain_pulse/core/api/dio_factory.dart';
import 'package:dio/dio.dart';

class AuthApiService {
  final String _baseUrl = "https://manoehab-001-site1.ltempurl.com/api/";

  Future<Map<String, dynamic>> post(
      {required String endpoint, required Map<String, dynamic> data}) async {
    final dio = await DioFactory.getDio();
    var response = await dio.post("$_baseUrl$endpoint",
        data: data,
        options: Options(headers: {
          ...dio.options.headers,
          'Content-Type': 'application/json',
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endpoint, required Map<String, dynamic> data}) async {
    final dio = await DioFactory.getDio();
    try {
      var response = await dio.put("$_baseUrl$endpoint",
          data: data,
          options: Options(headers: {
            ...dio.options.headers,
            'Content-Type': 'application/json',
          }));
      return response.data;
    } on DioException catch (e) {
      print('Error status: ${e.response?.statusCode}');
      print('Error data: ${e.response?.data}');
      throw e;
    }
  }

  Future<Map<String, dynamic>> postimage(
      {required String endpoint, required FormData data}) async {
    final dio = await DioFactory.getDio();
    try {
      var response = await dio.post("$_baseUrl$endpoint",
          data: data,
          options: Options(headers: {
            ...dio.options.headers,
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
