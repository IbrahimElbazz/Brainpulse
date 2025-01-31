import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/features/auth/register/ui/widgets/pass_and_email_register.dart';
import 'package:brain_pulse/features/auth/register/ui/widgets/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, this.ontap});
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const TopPage(),
            const PassAndEmail(),
            const GapH(
              height: 15,
            ),
            MyButton(
              onPressed: () {
                //   validatToRegister(context);
              },
              text: 'Create Account',
            ),
            //     registerBlocListener(),
            const GapH(
              height: 15,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: Color(0xffe0e0e0),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: const Text(
                    'Or sign in with',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: Color(0xffe0e0e0),
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const GapH(
              height: 15,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     CircleAvatar(
            //       backgroundColor:  Color(0xfff5f5f5),
            //       radius: 30,
            //       child: SvgPicture.asset("assets/svgs/googlelogo.svg"),
            //     ),
            //     CircleAvatar(
            //       backgroundColor:  Color(0xfff5f5f5),
            //       radius: 30,
            //       child: SvgPicture.asset("assets/svgs/facebook.svg"),
            //     ),
            //     CircleAvatar(
            //       backgroundColor:  Color(0xfff5f5f5),
            //       radius: 30,
            //       child: SvgPicture.asset("assets/svgs/apple.svg"),
            //     ),
            //   ],
            // ),
            //  SizedBox(
            //   height: 30,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By loggoing. you agree to our ",
                  style: TextStyle(
                      color: const Color(0xff9e9e9e), fontSize: 11.sp),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      color: const Color(0xff242424),
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                Text(
                  " and",
                  style: TextStyle(
                      color: const Color(0xff9e9e9e), fontSize: 11.sp),
                ),
              ],
            ),
            Center(
                child: GestureDetector(
              onTap: () {},
              child: Text("PrivacyPolicy",
                  style: TextStyle(
                    color: const Color(0xff242424),
                    fontSize: 14.sp,
                  )),
            )),
            const GapH(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account. ",
                  style: TextStyle(
                      color: const Color(0xff242424), fontSize: 13.sp),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                      color: const Color(0xff247cFF),
                      fontSize: 15.sp,
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
