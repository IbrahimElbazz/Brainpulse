import 'package:brain_pulse/features/splash/presentation/views/widgets/splash_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}
