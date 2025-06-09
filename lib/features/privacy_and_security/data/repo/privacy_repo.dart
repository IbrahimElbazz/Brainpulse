import 'package:brain_pulse/features/privacy_and_security/data/model/change_password_model.dart';
import 'package:brain_pulse/features/privacy_and_security/data/model/edit_doctor_model.dart';
import 'package:dartz/dartz.dart';

abstract class PrivacyRepo {
  Future<Either<String, ChangePasswordModel>> changepassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmNewPassword});
  Future<Either<String, bool>> deleteDoctor({required int id});
  Future<Either<String, EditDoctorModel>> editDoctor(
      {required String name,
      required String email,
      required String phoneNumber});
}
