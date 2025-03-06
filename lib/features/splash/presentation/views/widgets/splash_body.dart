import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/features/auth/login/presentation/controller/cubit/login_cubit.dart';
import 'package:brain_pulse/features/auth/login/presentation/controller/cubit/login_state.dart';
import 'package:brain_pulse/features/home/presentation/screens/home_screen.dart';
import 'package:brain_pulse/features/onBoarding/ui/screen/onBoadrding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    splash();
    context.read<LoginCubit>().checkLoginStatus();
  }

  splash() {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.read<LoginCubit>().state is LoadedLoginSate) {
        Navigator.pushReplacementNamed(context, Routes.appNavigation);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Center(
        child: Container(
          height: 300.h,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash.jpeg"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
