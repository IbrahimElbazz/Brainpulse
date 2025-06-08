import 'package:brain_pulse/core/api/auth_api_service.dart';
import 'package:brain_pulse/features/privacy_and_security/data/model/change_password_model.dart';
import 'package:brain_pulse/features/privacy_and_security/data/repo/privacy_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PrivacyRepoImple implements PrivacyRepo {
  AuthApiService authApiService;
  PrivacyRepoImple({required this.authApiService});
  @override
  Future<Either<String, ChangePasswordModel>> changepassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmNewPassword}) async {
    try {
      var data =
          await authApiService.put(endpoint: "Auth/change-Password", data: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmNewPassword": confirmNewPassword
      });
      return right(ChangePasswordModel.fromjson(data));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteDoctor({required int id}) async {
    try {
      final success = await authApiService.delete(endpoint: 'Auth/$id');

      if (success) {
        return right(true);
      } else {
        return left('Delete failed: unexpected server response.');
      }
    } on DioException catch (dioError) {
      print(
          '❌ DioException: ${dioError.response?.statusCode} - ${dioError.response?.data}');
      return left(
          'Dio error: ${dioError.response?.statusCode} - ${dioError.message}');
    } catch (e) {
      print('❌ Unknown Exception: $e');
      return left('Unknown error: $e');
    }
  }
}
