import 'package:brain_pulse/core/api/auth_api_service.dart';
import 'package:brain_pulse/features/auth/register/data/model/register_model.dart';
import 'package:brain_pulse/features/auth/register/data/repo/register_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterRepoImple implements RegisterRepo {
  AuthApiService authApiService;
  RegisterRepoImple({required this.authApiService});
  @override
  Future<Either<String, RegisterModel>> register(
      {required String email,
      required String password,
      required String phone,
      required String firstname,
      required String lastname}) async {
    try {
      var data = await authApiService.post(endpoint: "Auth/Register", data: {
        "email": email,
        "password": password,
        "phone": phone,
        "firstName": firstname,
        "lastName": lastname
      });
      return right(RegisterModel.fromJson(data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
