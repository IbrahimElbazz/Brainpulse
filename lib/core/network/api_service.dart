import 'package:brain_pulse/core/network/api_constant.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_response_model.dart';
import 'package:brain_pulse/features/history/data/model/get_all_patients_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //send data by doctor
  @POST(ApiConstant.sendDataByDoctor)
  Future<dynamic> sendDataByDoctor(
    @Body() SendPointRequestModel request,
  );

  // get all patients
  @GET(ApiConstant.getAllPatients)
  Future<List<GetAllPatientsResponse>> getAllPatients();
}
