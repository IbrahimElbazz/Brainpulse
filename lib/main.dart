import 'package:brain_pulse/features/splash/presentation/views/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/Theming/theme.dart';
import 'features/more/more.dart';
import 'features/more/ui/screen/edit_profile.dart';
import 'features/more/ui/screen/show_my_profile.dart';
import 'features/onBoarding/ui/screen/onBoadrding.dart';

void main() {
  runApp(const BrainPulse());
}

class BrainPulse extends StatelessWidget {
  const BrainPulse({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          title: 'Brain Pulse',
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: Theming.lightTheme,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            OnBoarding.routeName: (context) => const OnBoarding(),
            More.routeName: (context) => const More(),
            EditMyProfile.routeName: (context) => const EditMyProfile(),
            ShowMyProfile.routeName: (context) => const ShowMyProfile(),
          },
        )
    );

  }
}
