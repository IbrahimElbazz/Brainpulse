import 'dart:developer';

import 'package:brain_pulse/core/network/api_result.dart';
import 'package:brain_pulse/core/network/api_service.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/add_patient_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_response_model.dart';
import 'package:dio/dio.dart';

class SendPointRepo {
  SendPointRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<dynamic>> sendDataByDoctor(
      SendPointRequestModel request) async {
    try {
      final response = await _apiService.sendDataByDoctor(request);

      return ApiResult.success(response);
    } catch (e) {
      log(e.toString());
      return ApiResult.failure(e.toString());
    }
  }

  // Future<ApiResult> sendDataByDoctor(SendPointRequestModel request) async {
  //   try {
  //     final dio = Dio();

  //     final response = await dio.post(
  //       'http://manoehab-001-site1.ltempurl.com/api/AIModel/predict',
  //       data: request.toJson(),
  //       options: Options(
  //         followRedirects: true,
  //         maxRedirects: 5,
  //       ),
  //     );

  //     return ApiResult.success(
  //         SendPointResponseModel.fromJson(response.data as dynamic));
  //   } on DioException catch (e) {
  //     // معالجة أخطاء Dio بشكل أكثر تحديداً
  //     if (e.response != null) {
  //       if (e.response?.statusCode == 307) {
  //         return const ApiResult.failure(
  //             'Server error: 307 - Temporary Redirect');
  //       } else {
  //         return ApiResult.failure(
  //             'Server error: ${e.response?.statusCode} - ${e.response?.data}');
  //       }
  //     } else {
  //       return ApiResult.failure('Network error: ${e.message}');
  //     }
  //   } catch (e) {
  //     return ApiResult.failure('Unexpected error: $e');
  //   }
  // }
}

class AddPatientRepo {
  AddPatientRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult> addPatient(AddPatientRequestModel request) async {
    try {
      final response = await _apiService.addPatient(request);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
