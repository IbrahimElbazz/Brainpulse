import 'package:brain_pulse/core/Widgets/pop_circle_button.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/widgets/gap.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/card_item_in_my_account.dart';
import 'package:brain_pulse/features/privacy_and_security/presentation/widgets/logout_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyAndSecurity extends StatelessWidget {
  const PrivacyAndSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBar(
              title: const Text(
                'Privacy and Security',
              ),
              leading: const PopCircleButton(),
              centerTitle: true,
            ),
            const GapH(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: <Widget>[
                  CardItemInMyAccount(
                    icon: 'assets/svgs/lock-alt-in-priv.svg',
                    subTitle: 'Requires old password',
                    title: 'Change password',
                    onTap: () {
                      context.pushNamed('/ChangePasswordScreen');
                    },
                  ),
                  const GapH(height: 24),
                  CardItemInMyAccount(
                    icon: 'assets/svgs/delete.svg',
                    subTitle: 'Account data will be permanently deleted.',
                    title: 'Delete account',
                    titleColor: const Color(0xFFFEAA43),
                    colorBackgroundIcon: const Color(0xFFFFEED9),
                    onTap: () {
                      context.pushNamed('/DeleteAccount');
                    },
                  ),
                  const GapH(height: 24),
                  CardItemInMyAccount(
                    isLogout: true,
                    icon: 'assets/svgs/arrow-square-right.svg',
                    subTitle:
                        'You will need your login details when you log in again.',
                    title: 'Logout',
                    titleColor: Colors.red,
                    colorBackgroundIcon: const Color(0xFFFADCDF),
                    onTap: () {
                      showModalBottomSheet(
                        sheetAnimationStyle: AnimationStyle(
                          duration: const Duration(microseconds: 500000),
                          curve: Curves.linear,
                        ),
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (BuildContext context) {
                          return const LogoutBottomSheet();
                        },
                      );
                    },
                  ),
                  const GapH(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
