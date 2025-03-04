import 'package:brain_pulse/core/api/auth_api_service.dart';
import 'package:brain_pulse/core/network/api_service.dart';
import 'package:brain_pulse/core/network/dio_factory.dart';
import 'package:brain_pulse/features/auth/login/data/repo/login_repo_imple.dart';
import 'package:brain_pulse/features/data_by_doctor/data/repo/send_point_repo.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  // API Services
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio: dio));

  // login
  getIt.registerLazySingleton<LoginRepoImple>(
      () => LoginRepoImple(authApiService: getIt<AuthApiService>()));

  // 4️⃣ تسجيل Cubits
  getIt.registerLazySingleton<SendDataByDoctorCubit>(
      () => SendDataByDoctorCubit(getIt<SendPointRepo>()));

  getIt.registerLazySingleton<SendPointRepo>(
      () => SendPointRepo(getIt<ApiService>()));
}
