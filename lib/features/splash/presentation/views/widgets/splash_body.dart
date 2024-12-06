import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/features/onBoarding/ui/screen/onBoadrding.dart';
import 'package:brain_pulse/main.dart';
import 'package:flutter/material.dart';
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
  }

  splash() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const OnBoadrding();
      }));
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
