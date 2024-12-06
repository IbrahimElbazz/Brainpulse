import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/features/app_navigation/app_navigation.dart';
import 'package:brain_pulse/features/auth/login/ui/widgets/loginBlocListener.dart';
import 'package:brain_pulse/features/auth/login/ui/widgets/lowerDesignLogin.dart';
import 'package:brain_pulse/features/auth/login/ui/widgets/pass_and_email_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isChecked = false;
    return Scaffold(
        backgroundColor: ColorsApp.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenSize.height * .13,
              horizontal: screenSize.height * .03,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyleApp.font32wieght700ColorBlue,
                ),
                verticalSpace(20),
                Text(
                  '''We"re excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.''',
                  style: TextStyleApp.font14weight400colorGrey,
                ),
                SizedBox(
                  height: screenSize.height * .04,
                ),
                const EmailAndPass(),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (_) {},
                        ),
                        Text('Remember me',
                            style: TextStyleApp.font12weight400colorGrey),
                      ],
                    ),
                    Text('Forget Password?',
                        style: TextStyleApp.font12weight400colorGrey
                            .copyWith(color: ColorsApp.blue)),
                  ],
                ),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                MyButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AppNavigation();
                    }));
                  },
                  text: 'Login',
                ),
                SizedBox(
                  height: screenSize.height * .05,
                ),
                const lowerDesignLogin(),
                //   const loginBlocListener(),
              ],
            ),
          ),
        ));
  }

  // void validateThenDoLogin(BuildContext context) {
  //   if (context.read<LoginCubit>().formKey.currentState!.validate()) {
  //     context.read<LoginCubit>().emitLoginStates();
  //   }
  // }
}
