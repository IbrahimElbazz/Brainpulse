import 'package:brain_pulse/features/app_navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const BrainPulse());
}

class BrainPulse extends StatelessWidget {
  const BrainPulse({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Brain Pulse',
          debugShowCheckedModeBanner: false,
          home: AppNavigation(),
        ));
  }
}
