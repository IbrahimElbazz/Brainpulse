import 'package:brain_pulse/core/routing/animation_route.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/features/app_navigation/app_navigation.dart';
import 'package:brain_pulse/features/auth/login/presentation/views/login.dart';
import 'package:brain_pulse/features/home/presentation/screens/drop_file_screen.dart';
import 'package:brain_pulse/features/home/presentation/screens/eeg_data_screen.dart';
import 'package:brain_pulse/features/data_by_doctor/presentation/screens/data_by_doctor_screen.dart';
import 'package:brain_pulse/features/home/presentation/screens/get_image_screen.dart';
import 'package:brain_pulse/features/home/presentation/screens/home_screen.dart';
import 'package:brain_pulse/features/my_account/presentation/screens/edit_profile_screen.dart';
import 'package:brain_pulse/features/onboarding/presentation/screens/onboarding.dart';
import 'package:brain_pulse/features/splash/presentation/views/spalsh_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return AppHelperFunctions().fadeTransition(
          page: const SplashScreen(),
        );
      case Routes.onBoarding:
        return AppHelperFunctions().fadeTransition(
          page: const Onboarding(),
        );
      case Routes.loginScreen:
        return AppHelperFunctions().fadeTransition(
          page: const LogInScreen(),
        );
      case Routes.appNavigation:
        return AppHelperFunctions().fadeTransition(
          page: const AppNavigation(),
        );
      case Routes.homeScreen:
        return AppHelperFunctions().fadeTransition(
          page: const HomeScreen(),
        );
      case Routes.getImage:
        return AppHelperFunctions().fadeTransition(
          page: const GetImageScreen(),
        );
      case Routes.eegdata:
        return AppHelperFunctions().fadeTransition(
          page: const EegDataScreen(),
        );
      case Routes.dataByDoctorScreen:
        return AppHelperFunctions().fadeTransition(
          page: const DataByDoctorScreen(),
        );
      case Routes.dropfilescreen:
        return AppHelperFunctions().fadeTransition(
          page: const DropFileScreen(),
        );
      case Routes.editProfileScreen:
        return AppHelperFunctions().fadeTransition(
          page: const EditProfileScreen(),
        );
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
