import 'package:brain_pulse/core/api/api_service.dart';
import 'package:brain_pulse/features/auth/login/data/model/login_model.dart';
import 'package:brain_pulse/features/auth/login/data/repo/login_repo.dart';
import 'package:dartz/dartz.dart';

class LoginRepoImple implements LoginRepo {
  ApiService apiService;
  LoginRepoImple({required this.apiService});
  @override
  Future<Either<String, LoginModel>> postlogin(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
          endpoint: "Auth/login", data: {"email": email, "password": password});
      return right(LoginModel.fromJson(data));
    } catch (e) {
      return left(e.toString());
    }
  }
}
