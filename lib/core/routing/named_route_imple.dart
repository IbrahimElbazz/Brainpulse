import 'package:brain_pulse/core/routing/named_route.dart';
import 'package:brain_pulse/features/app_navigation/app_navigation.dart';
import 'package:brain_pulse/features/home/presentation/screens/get_image_screen.dart';
import 'package:brain_pulse/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashScreen:
      //   return MaterialPageRoute(builder: (_) => const SizedBox.shrink());
      case Routes.appnavigation:
        return MaterialPageRoute(builder: (_) => const AppNavigation());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.getiamge:
        return MaterialPageRoute(builder: (_) => const GetImageScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("NO route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
