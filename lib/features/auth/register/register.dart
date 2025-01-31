import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/features/auth/register/ui/widgets/pass_and_email_register.dart';
import 'package:brain_pulse/features/auth/register/ui/widgets/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, this.ontap});
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const TopPage(),
            const PassAndEmail(),
            const SizedBox(
              height: 20,
            ),
            MyButton(
              onPressed: () {
                //   validatToRegister(context);
              },
              text: 'Create Account',
            ),
            //    const registerBlocListener(),
            const SizedBox(
              height: 30,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xffe0e0e0),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Or sign in with',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xffe0e0e0),
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xfff5f5f5),
                  radius: 30,
                  child: SvgPicture.asset("assets/svgs/googlelogo.svg"),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xfff5f5f5),
                  radius: 30,
                  child: SvgPicture.asset("assets/svgs/facebook.svg"),
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xfff5f5f5),
                  radius: 30,
                  child: SvgPicture.asset("assets/svgs/apple.svg"),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "By logging. you agree to our ",
                  style: TextStyle(color: Color(0xff9e9e9e), fontSize: 11),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      color: Color(0xff242424),
                      fontSize: 13,
                    ),
                  ),
                ),
                const Text(
                  " and",
                  style: TextStyle(color: Color(0xff9e9e9e), fontSize: 11),
                ),
              ],
            ),
            Center(
                child: GestureDetector(
              onTap: () {},
              child: const Text("PrivacyPolicy",
                  style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 14,
                  )),
            )),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an Account. ",
                  style: TextStyle(color: Color(0xff242424), fontSize: 13),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: const Text(
                    "SignIn",
                    style: TextStyle(
                      color: Color(0xff247cFF),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // validatToRegister(BuildContext context) {
  //   if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
  //     context.read<RegisterCubit>().emitRegisterStates();
  //   }
  // }
}
