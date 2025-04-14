import 'dart:async';

import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/pop_circle_button.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/core/widgets/gap.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/button.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppBar(
                title: const Text(
                  'Change password',
                ),
                leading: const PopCircleButton(),
                centerTitle: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: <Widget>[
                    const GapH(height: 65),
                    Text(
                      'Create a new password',
                      style: TextStyle(
                        color: const Color(0xFF1D2035),
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const GapH(height: 28),
                    textFieldCustom(
                      obscureText: !isShow,
                      hintText: 'Current password',
                      iconP: IconButton(
                        icon: IconButton(
                          icon: SvgPicture.asset('assets/svgs/lock-alt.svg'),
                          onPressed: () {},
                        ),
                        onPressed: () {},
                      ),
                      iconS: GestureDetector(
                        child: isShow
                            ? SvgPicture.asset(
                                'assets/svgs/eye.svg',
                                fit: BoxFit.scaleDown,
                              )
                            : SvgPicture.asset(
                                'assets/svgs/eye-slash.svg',
                                fit: BoxFit.scaleDown,
                              ),
                        onTap: () {
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                      ),
                    ),
                    const GapH(height: 14),
                    textFieldCustom(
                      obscureText: !isShow,
                      hintText: 'Please enter the new password..',
                      iconP: IconButton(
                        icon: IconButton(
                          icon: SvgPicture.asset('assets/svgs/lock-alt.svg'),
                          onPressed: () {},
                        ),
                        onPressed: () {},
                      ),
                      iconS: GestureDetector(
                        child: isShow
                            ? SvgPicture.asset(
                                'assets/svgs/eye.svg',
                                fit: BoxFit.scaleDown,
                              )
                            : SvgPicture.asset(
                                'assets/svgs/eye-slash.svg',
                                fit: BoxFit.scaleDown,
                              ),
                        onTap: () {
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                      ),
                    ),
                    const GapH(height: 14),
                    textFieldCustom(
                      obscureText: !isShow,
                      hintText: 'Re-enter new password..',
                      iconP: IconButton(
                        icon: IconButton(
                          icon: SvgPicture.asset('assets/svgs/lock-alt.svg'),
                          onPressed: () {},
                        ),
                        onPressed: () {},
                      ),
                      iconS: GestureDetector(
                        child: isShow
                            ? SvgPicture.asset(
                                'assets/svgs/eye.svg',
                                fit: BoxFit.scaleDown,
                              )
                            : SvgPicture.asset(
                                'assets/svgs/eye-slash.svg',
                                fit: BoxFit.scaleDown,
                              ),
                        onTap: () {
                          setState(() {
                            isShow = !isShow;
                          });
                        },
                      ),
                    ),
                    const GapH(height: 50),
                    CustomButtonAcc(
                      color: ColorsApp.primary,
                      text: 'Confirm',
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 450.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 24.w),
                                child: Column(
                                  children: <Widget>[
                                    const GapH(height: 53),
                                    Container(
                                      width: 166.80.w,
                                      height: 166.80.h,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFDDFAF2),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(138),
                                        ),
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'assets/svgs/doneCheck.svg',
                                        ),
                                      ),
                                    ),
                                    const GapH(
                                      height: 20,
                                    ),
                                    Text(
                                      'Password changed successfully',
                                      style: TextStyle(
                                        color: const Color(0xFF2B2F4E),
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const GapH(height: 16),
                                    Text(
                                      textAlign: TextAlign.center,
                                      'Try to keep your password away to avoid having your account data stolen.',
                                      style: TextStyle(
                                        color: const Color(0xFF637D92),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const GapH(height: 28),
                                    CustomButtonAcc(
                                      color: const Color(0xFF0CAFB4),
                                      text: 'Done',
                                      onTap: () {
                                        context.pop();
                                        context.pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
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
