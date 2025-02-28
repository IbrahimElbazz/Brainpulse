import 'package:brain_pulse/core/di/dependency_injection.dart';
import 'package:brain_pulse/core/helpers/bloc_observer.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/core/routing/app_router..dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/Theming/theme.dart';

void main() {
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(const BrainPulse());
}

class BrainPulse extends StatelessWidget {
  const BrainPulse({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
          title: 'Brain Pulse',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: AppRouter.generateRoute,
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          // home: AppNavigation(),
          ),
    );
  }
}
