import 'package:brain_pulse/core/helpers/shared_pref_helper/shared_pref_helper.dart';
import 'package:brain_pulse/core/helpers/shared_pref_helper/shared_pref_keys.dart';
import 'package:dio/dio.dart';

class DioFactory {
  static Dio? _dio;

  static Future<Dio> getDio() async {
    if (_dio == null) {
      _dio = Dio();
      await _setOptions();
    }
    return _dio!;
  }

  static Future<void> _setOptions() async {
    final token = await SharedPrefHelper.getString(key: SharedPrefKeys.token);
    _dio!.options.headers = {
      'Content-Type': 'application/json',
    };

    if (token.isNotEmpty) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  // تحدث التوكين في الهيدر بعد login
  static Future<void> setToken(String token) async {
    if (_dio != null) {
      _dio!.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  // شيل التوكين من الهيدر بعد logout
  static void clearToken() {
    if (_dio != null) {
      _dio!.options.headers.remove('Authorization');
    }
  }
}
