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
  // 1️⃣ إنشاء Dio
  Dio dio = DioFactory.getDio();

  // 2️⃣ تسجيل الـ API Services
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<AuthApiService>(() => AuthApiService(dio: dio));

  // 3️⃣ تسجيل Repositories (المستودعات)
  getIt.registerLazySingleton<LoginRepoImple>(
      () => LoginRepoImple(authApiService: getIt<AuthApiService>()));

  getIt.registerLazySingleton<SendPointRepo>(
      () => SendPointRepo(getIt<ApiService>()));

  // 4️⃣ تسجيل Cubits
  getIt.registerLazySingleton<SendDataByDoctorCubit>(
      () => SendDataByDoctorCubit(getIt<SendPointRepo>()));
}
