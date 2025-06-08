import 'package:brain_pulse/core/api/auth_api_service.dart';
import 'package:brain_pulse/features/privacy_and_security/data/model/change_password_model.dart';
import 'package:brain_pulse/features/privacy_and_security/data/repo/privacy_repo.dart';
import 'package:dartz/dartz.dart';

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
}
