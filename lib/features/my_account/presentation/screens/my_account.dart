import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/widgets/gap.dart';
import 'package:brain_pulse/features/auth/login/presentation/controller/cubit/login_cubit.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/card_item_in_my_account.dart';
import 'package:brain_pulse/features/my_account/presentation/widgets/image_and_background_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../generated/app_localizations.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  String? doctorName;

  @override
  void initState() {
    super.initState();
    loadDoctorName();
  }

  Future<void> loadDoctorName() async {
    final cubit = context.read<LoginCubit>();
    await cubit.loadUserDataFromPrefs();
    setState(() {
      doctorName = cubit.username;
    });
  }

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
                onTap: () async {
                  await context.pushNamed('/EditProfileScreen');
                  await loadDoctorName();
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          'DR: ${doctorName ?? "loading..."}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : const Color(0xFF1D2035)),
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const GapH(height: 18),
                    Divider(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    const GapH(height: 24),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/user-pen.svg',
                      title: AppLocalizations.of(context)!.edit_profile,
                      subTitle: AppLocalizations.of(context)!.edit_name_email,
                      onTap: () async {
                        await context.pushNamed('/EditProfileScreen');
                        await loadDoctorName();
                      },
                    ),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/shield-check.svg',
                      title: AppLocalizations.of(context)!.privacy_and_security,
                      subTitle: AppLocalizations.of(context)!.change_password_data,
                      onTap: () {
                        context.pushNamed('/PrivacyAndSecurity');
                      },
                    ),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/dark-theme-svgrepo-com.svg',
                      //colorBackgroundIcon: ColorsApp.primary,
                      colorsvg: ColorsApp.primary,
                      title: AppLocalizations.of(context)!.theme_mode,
                      subTitle: AppLocalizations.of(context)!.dark_light_mode,
                      onTap: () {
                        context.pushNamed('/themedata');
                      },
                    ),
                    CardItemInMyAccountImage(
                      icon: 'assets/images/language.png',
                        title: AppLocalizations.of(context)!.language,
                        subTitle: AppLocalizations.of(context)!.change_app_language,
                        onTap: () {
                          context.pushNamed('/languageScreen');
                        }
                    ),
                    CardItemInMyAccount(
                      icon: 'assets/svgs/message-circle-question.svg',
                      title: AppLocalizations.of(context)!.help_center,
                      subTitle: AppLocalizations.of(context)!.technical_support,
                      onTap: () async {
                        final phone = '201024112206';
                        final message =
                            Uri.encodeComponent("Hello, I need help!!!!!");
                        final url =
                            Uri.parse("https://wa.me/$phone?text=$message");

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              content: Text(AppLocalizations.of(context)!.error_try_again),
                            ),
                          );
                        }
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
