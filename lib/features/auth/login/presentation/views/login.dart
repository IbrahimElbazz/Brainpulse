import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/features/auth/login/presentation/controller/cubit/login_cubit.dart';
import 'package:brain_pulse/features/auth/login/presentation/controller/cubit/login_state.dart';
import 'package:brain_pulse/features/auth/login/presentation/views/ui/widgets/lowerDesignLogin.dart';
import 'package:brain_pulse/features/auth/login/presentation/views/ui/widgets/pass_and_email_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isChecked = false;
    var read = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoadedLoginSate) {
        Navigator.pushNamed(context, Routes.appNavigation);
      } else if (state is ErrorLoginState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errormsg)),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  gapH(20),
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
                  read.isloading == false
                      ? MyButton(
                          onPressed: () {
                            if (read.keyform.currentState!.validate()) {
                              read.loginvalidate();
                            }
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const AppNavigation();
                            // }));
                          },
                          text: 'Login',
                        )
                      : const CircularProgressIndicator(
                          color: Colors.black,
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
    });
  }
}
