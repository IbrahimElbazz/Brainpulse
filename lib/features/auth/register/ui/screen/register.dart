import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/mybutton.dart';
import 'package:brain_pulse/core/Widgets/mytextfield.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Padding(
          padding: EdgeInsets.only(
            top: screenSize.height * .13,
            left: screenSize.height * .03,
            right: screenSize.height * .03,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create Account",
                  style: TextStyleApp.font32wieght700ColorBlue,
                ),
                SizedBox(
                  height: screenSize.height * .03,
                ),
                Text(
                  "Sign up now and start exploring all that our\napp has to offer. We're excited to welcome\nyou to our community!",
                  style: TextStyleApp.font14weight400colorGrey,
                ),
                SizedBox(
                  height: screenSize.height * .04,
                ),
                MyTextField(
                  validator: (p0) {},
                  showtext: false,
                  hint: 'Email',
                  icon: const Icon(Icons.email_outlined),
                ),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                MyTextField(
                    validator: (p0) {},
                    icon: const Icon(Icons.visibility),
                    showtext: true,
                    hint: "Password"),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                IntlPhoneField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      )),
                  hintText: "Your number",
                  hintStyle: TextStyleApp.styleText(
                      15, Colors.grey, FontWeight.normal),
                  fillColor: const Color(0xffFDFDFF),
                )),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                MyButton(
                  onPressed: () {},
                  text: 'Create Account',
                ),
                SizedBox(
                  height: screenSize.height * .05,
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
                SizedBox(
                  height: screenSize.height * .04,
                ),
                const SignInWith(),
                SizedBox(
                  height: screenSize.height * .04,
                ),
                const TermsAndConditions(),
                SizedBox(
                  height: screenSize.height * .04,
                ),
                LogIn(
                  text1: 'Already have an account yet? ',
                  text2: "Login",
                ),
              ],
            ),
          )),
    );
  }
}

class SignInWith extends StatelessWidget {
  const SignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: ColorsApp.grey.withOpacity(0.07),
          radius: 30,
          child: SvgPicture.asset("assets/svgs/googlelogo.svg"),
        ),
        CircleAvatar(
          backgroundColor: ColorsApp.grey.withOpacity(0.07),
          radius: 30,
          child: SvgPicture.asset("assets/svgs/facebook.svg"),
        ),
        CircleAvatar(
          backgroundColor: ColorsApp.grey.withOpacity(0.07),
          radius: 30,
          child: SvgPicture.asset("assets/svgs/apple.svg"),
        ),
      ],
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "By logging. you agree to our ",
              style: TextStyleApp.font12weight400colorGrey.copyWith(
                fontSize: 11,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                "Terms & Conditions",
                style: TextStyle(
                  color: Color(0xff242424),
                  fontSize: 11,
                ),
              ),
            ),
            Text(
              " and",
              style: TextStyleApp.font12weight400colorGrey.copyWith(
                fontSize: 11,
              ),
            ),
          ],
        ),
        Center(
            child: GestureDetector(
          onTap: () {},
          child: const Text("PrivacyPolicy.",
              style: TextStyle(
                color: Color(0xff242424),
                fontSize: 11,
              )),
        )),
      ],
    );
  }
}

class LogIn extends StatelessWidget {
  String text1;
  String text2;

  LogIn({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyleApp.font12weight400colorGrey.copyWith(fontSize: 11),
        ),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            text2,
            style: TextStyleApp.font12weight400colorGrey.copyWith(
              color: ColorsApp.blue,
              fontSize: 11,
            ),
          ),
        )
      ],
    );
  }
}
