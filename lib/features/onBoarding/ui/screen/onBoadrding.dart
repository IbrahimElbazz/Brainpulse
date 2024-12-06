import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:brain_pulse/features/auth/login/ui/screen/login.dart';
import 'package:brain_pulse/features/onBoarding/ui/screen/widgets/logo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoadrding extends StatelessWidget {
  const OnBoadrding({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: ColorsApp.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: ColorsApp.white,
      ),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            bool? exitConfirm = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Exit App'),
                content: const Text('Are you sure you want to exit the app?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            );

            if (exitConfirm ?? false) {
              SystemNavigator.pop();
            }

            return Future.value(false);
          },
          child: Scaffold(
            backgroundColor: ColorsApp.white,
            appBar: AppBar(
              toolbarHeight: 30.h,
              leading: Container(),
              backgroundColor: ColorsApp.white,
              surfaceTintColor: ColorsApp.white,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LogoApp(
                    width_logo: 40.w,
                    width_logo_text: 100.w,
                  ),
                  SizedBox(
                    height: 150.h,
                  ),
                  Image.asset(
                    'assets/images/logo.jpeg',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      'Physician Assistant is a specialty of Brain Pulse',
                      style: TextStyle(
                        color: ColorsApp.grey,
                        fontSize: 12.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 35),
                    child: MyButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LogInScreen();
                        }));
                      },
                      text: 'Get Started',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
