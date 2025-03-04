import 'package:brain_pulse/core/network/api_result.dart';
import 'package:brain_pulse/core/network/api_service.dart';
import 'package:brain_pulse/features/history/data/model/get_all_patients_response.dart';

class GetAllPatientsRepo {
  final ApiService _apiService;

  GetAllPatientsRepo(this._apiService);

  Future<ApiResult<List<GetAllPatientsResponse>>> getAllPatients() async {
    try {
      final response = await _apiService.getAllPatients();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
