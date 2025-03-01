import 'package:brain_pulse/core/network/api_service.dart';
import 'package:brain_pulse/core/network/dio_factory.dart';
import 'package:brain_pulse/features/data_by_doctor/data/repo/send_point_repo.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // send data by doctor
  getIt.registerLazySingleton<SendDataByDoctorCubit>(
      () => SendDataByDoctorCubit(getIt()));
  getIt.registerFactory<SendPointRepo>(() => SendPointRepo(getIt()));
}
