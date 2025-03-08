import 'package:brain_pulse/features/auth/register/data/model/register_model.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepo {
  Future<Either<String, RegisterModel>> register(
      {required String email,
      required String password,
      required String phone,
      required String firstname,
      required String lastname});
}
