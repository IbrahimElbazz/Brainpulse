import 'dart:developer';

import 'package:brain_pulse/core/network/api_result.dart';
import 'package:brain_pulse/core/network/api_service.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/add_patient_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_request_model.dart';

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


//   Future<ApiResult> sendDataByDoctor(SendPointRequestModel request) async {
//     try {
//       final dio = Dio(BaseOptions(
//         followRedirects: true, // يسمح بمتابعة التوجيهات تلقائياً
//         maxRedirects: 5, // زيادة عدد المحاولات للتوجيه
//         validateStatus: (status) {
//           // قبول رموز الحالة الناجحة بما في ذلك التوجيهات
//           return status != null && (status >= 200 && status < 400);
//         },
//       ));

//       final response = await dio.post(
//         'http://manoehab-001-site1.ltempurl.com/api/AIModel/predict',
//         data: request.toJson(),
//         options: Options(
//           followRedirects: true,
//           maxRedirects: 5,
//         ),
//       );

//       return ApiResult.success(SendPointResponseModel.fromJson(response.data));
//     } on DioException catch (e) {
//       // معالجة أخطاء Dio بشكل أكثر تحديداً
//       if (e.response != null) {
//         return ApiResult.failure(
//             'Server error: ${e.response?.statusCode} - ${e.response?.data}');
//       } else {
//         return ApiResult.failure('Network error: ${e.message}');
//       }
//     } catch (e) {
//       return ApiResult.failure('Unexpected error: $e');
//     }
//   }
// }