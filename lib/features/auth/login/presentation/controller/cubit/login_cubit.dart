import 'dart:developer';

import 'package:brain_pulse/core/helpers/shared_pref_helper/shared_pref_helper.dart';
import 'package:brain_pulse/core/helpers/shared_pref_helper/shared_pref_keys.dart';
import 'package:brain_pulse/core/network/dio_factory.dart';
import 'package:brain_pulse/features/auth/login/data/repo/login_repo_imple.dart';
import 'package:brain_pulse/features/auth/login/presentation/controller/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepoImple}) : super(InitialLoginSate());
  LoginRepoImple loginRepoImple;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  GlobalKey<FormState> keyform = GlobalKey();
  Map<String, dynamic> decodedToken = {};
  bool isloading = false;

  Future<void> loginUserCubit() async {
    emit(LoadingLoginSate());
    isloading = true;
    var value = await loginRepoImple.postlogin(
        email: email.text, password: password.text);
    return value.fold((error) {
      isloading = false;
      emit(ErrorLoginState(errormsg: error));
    }, (response) async {
      try {
        await SharedPrefHelper.setData(
            key: SharedPrefKeys.token, value: response.token);
        log("Token Saved : ${response.token}");
        await saveUserToken(response.token);
        await SharedPrefHelper.setData(
            key: SharedPrefKeys.email, value: email.text);

        decodedToken = JwtDecoder.decode(response.token);

        isloading = false;
        emit(LoadedLoginSate());
      } catch (e) {
        isloading = false;
        emit(ErrorLoginState(errormsg: 'Token save or decode error: $e'));
      }
    });
  }

  void loginvalidate() {
    if (keyform.currentState!.validate()) {
      loginUserCubit();
    }
  }

  Future<void> checkLoginStatus() async {
    final token = await SharedPrefHelper.getString(key: SharedPrefKeys.token);
    log("Retrieved Token: $token");
    if (token.isNotEmpty) {
      if (!JwtDecoder.isExpired(token)) {
        decodedToken = JwtDecoder.decode(token);
        emit(LoadedLoginSate());
      } else {
        await SharedPrefHelper.removeData(key: SharedPrefKeys.token);
        emit(InitialLoginSate());
      }
    } else {
      emit(InitialLoginSate());
    }
  }

  Future<void> logout() async {
    await SharedPrefHelper.removeData(key: SharedPrefKeys.token);
    await SharedPrefHelper.removeData(key: SharedPrefKeys.email);
    email.clear();
    password.clear();
    emit(InitialLoginSate());
  }

  // set token in header service
  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(key: SharedPrefKeys.token, value: token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
