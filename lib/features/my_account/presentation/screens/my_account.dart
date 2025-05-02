import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/widgets/gap.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/card_item_in_my_account.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/image_and_background_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  context.pushNamed('/EditProfileScreen');
                },
                child: const ImageAndBackgroundBar(
                  background: 'assets/images/background.png',
                  image: 'assets/images/OO6PT80.jpeg',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Doctor name',
                      style: TextStyle(
                        color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : const Color(0xFF1D2035)),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const GapH(height: 18),
                    Divider(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const GapH(height: 24),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/user-pen.svg',
                      title: 'Edit Profile',
                      subTitle: 'Edit . Name . Email',
                      onTap: () {
                        context.pushNamed('/EditProfileScreen');
                      },
                    ),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/shield-check.svg',
                      title: 'Privacy and Security',
                      subTitle: 'Change your password . Personal data ',
                      onTap: () {
                        context.pushNamed('/PrivacyAndSecurity');
                      },
                    ),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/dark-theme-svgrepo-com.svg',
                      //colorBackgroundIcon: ColorsApp.primary,
                      colorsvg: ColorsApp.primary,
                      title: 'Theme Mode',
                      subTitle: 'Dark , Light Mode ',
                      onTap: () {
                        context.pushNamed('/themedata');
                      },
                    ),
                    CardItemInMyAccountImage(
                      icon: 'assets/images/language.png',
                      title: 'Language',
                      subTitle: 'Change app language ',
                      onTap: () {
                        // context.pushNamed('/LanguageScreen');
                      },
                    ),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/message-circle-question.svg',
                      title: 'Help Center',
                      subTitle: 'technical support',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
