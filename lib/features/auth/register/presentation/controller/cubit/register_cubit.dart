import 'package:brain_pulse/features/auth/register/data/repo/register_repo_imple.dart';
import 'package:brain_pulse/features/auth/register/presentation/controller/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerRepoImple})
      : super(InitialRegisterState());
  RegisterRepoImple registerRepoImple;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> keyform = GlobalKey();
  bool isLoading = false;
  String? confirmPasswordError;
  Future<void> registerUserCubit() async {
    isLoading = true;
    emit(LoadingRegisterState());
    var value = await registerRepoImple.register(
        email: email.text,
        password: password.text,
        phone: phone.text,
        firstname: firstname.text,
        lastname: lastname.text);
    return value.fold((error) {
      isLoading = false;
      emit(FailuerRegisterState(errormsg: error));
    }, (register) {
      isLoading = false;
      emit(LoadedRegisterState());
    });
  }

  void registervalidate() {
    if (!confirmpasswordValidate()) {
      emit(FailuerRegisterState(errormsg: "Passwords do not match!"));
      return;
    }

    if (keyform.currentState!.validate()) {
      registerUserCubit();
    }
  }

  bool confirmpasswordValidate() {
    if (password.text != confirmpassword.text) {
      confirmPasswordError = "Passwords do not match!";
      emit(InitialRegisterState());
      return false;
    }
    confirmPasswordError = null;
    return true;
  }
}
