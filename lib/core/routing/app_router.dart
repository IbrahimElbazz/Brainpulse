import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/features/app_navigation/app_navigation.dart';
import 'package:brain_pulse/features/auth/login/presentation/views/login.dart';
import 'package:brain_pulse/features/home/presentation/screens/eeg_data_screen.dart';
import 'package:brain_pulse/features/data_by_doctor/presentation/screens/data_by_doctor_screen.dart';
import 'package:brain_pulse/features/home/presentation/screens/get_image_screen.dart';
import 'package:brain_pulse/features/home/presentation/screens/home_screen.dart';
import 'package:brain_pulse/features/splash/presentation/views/spalsh_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LogInScreen());
      case Routes.appNavigation:
        return MaterialPageRoute(builder: (_) => const AppNavigation());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.getImage:
        return MaterialPageRoute(builder: (_) => const GetImageScreen());
      case Routes.eegdata:
        return MaterialPageRoute(builder: (_) => const EegDataScreen());
      case Routes.dataByDoctorScreen:
        return MaterialPageRoute(builder: (_) => const DataByDoctorScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("NO route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
