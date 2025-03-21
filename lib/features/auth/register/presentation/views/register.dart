import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/features/auth/register/presentation/controller/cubit/register_cubit.dart';
import 'package:brain_pulse/features/auth/register/presentation/controller/cubit/register_state.dart';
import 'package:brain_pulse/features/auth/register/presentation/views/widgets/terms_and_conditioins.dart';
import 'package:brain_pulse/features/auth/register/presentation/views/widgets/pass_and_email_register.dart';
import 'package:brain_pulse/features/auth/register/presentation/views/widgets/top_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, this.ontap});
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    var read = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is LoadedRegisterState) {
        Navigator.pop(context);
      } else if (state is FailuerRegisterState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errormsg)),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              read.isLoading == false
                  ? MyButton(
                      onPressed: () {
                        if (read.keyform.currentState!.validate()) {
                          return read.registervalidate();
                        }
                        read.confirmpasswordValidate();
                      },
                      text: 'Create Account',
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
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
             const TermsAndConditions(),
              const GapH(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account. ",
                      style: Theme.of(context).textTheme.bodySmall),
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
    });
  }

  // validatToRegister(BuildContext context) {
  //   if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
  //     context.read<RegisterCubit>().emitRegisterStates();
  //   }
  // }
}
