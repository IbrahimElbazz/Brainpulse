import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  HawkFabMenuController hawkFabMenuController = HawkFabMenuController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: HawkFabMenu(
        icon: AnimatedIcons.menu_arrow,
        fabColor: ColorsApp.primary,
        iconColor: Colors.white,
        hawkFabMenuController: hawkFabMenuController,
        items: [
          HawkFabMenuItem(
            label: 'By Hospital',
            ontap: () {
              Navigator.pushNamed(context, Routes.getImage);
            },
            icon: Image.asset(
              'assets/images/medical_icons.png',
              color: ColorsApp.primary,
              height: 25.h,
              fit: BoxFit.scaleDown,
            ),
            color: Colors.white,
            labelColor: ColorsApp.primary,
          ),
          HawkFabMenuItem(
            heroTag: 'doctor',
            label: 'By Doctor',
            ontap: () {
              Navigator.pushNamed(context, Routes.dataByDoctorScreen);
            },
            icon: Image.asset(
              'assets/images/doctor_icon.png',
              color: ColorsApp.primary,
              height: 25.h,
            ),
            color: Colors.white,
            labelColor: ColorsApp.primary,
          ),
        ],
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GapH(
                  height: 20,
                ),
                Text(
                  'Hello doctor Name',
                  style: TextStyle(
                    color: ColorsApp.primary,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Brain Pulse is a medical platform that helps you to diagnose and monitor neurological disorders by using electroencephalography (EEG) technique.',
                  style: TextStyleApp.font14weight400colorGrey,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'You can diagnose and monitor by hospital or by doctor.',
                  style: TextStyleApp.font14weight400colorGrey,
                ),
                SizedBox(
                  height: 150.h,
                ),
                //          Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SizedBox(
                //       width: 160.w,
                //       child: CustomButtonAcc(
                //         icon: true,
                //         iconWidget:
                // Image.asset(
                //           'assets/images/medical_icons.png',
                //           color: ColorsApp.primary,
                //           height: 35.h,
                //         ),
                //         color: ColorsApp.primary.withOpacity(0.1),
                //         text: "By Hospital",
                //         textColor: ColorsApp.primary,
                //         onTap: () {
                //           Navigator.pushNamed(context, Routes.getImage);
                //         },
                //       ),
                //     ),
                //     SizedBox(
                //       width: 20.w,
                //     ),
                //     SizedBox(
                //       width: 160.w,
                //       child: CustomButtonAcc(
                //         icon: true,
                //         iconWidget: Image.asset(
                //           'assets/images/doctor_icon.png',
                //           color: ColorsApp.primary,
                //           height: 35.h,
                //         ),
                //         color: ColorsApp.primary.withOpacity(0.1),
                //         text: "By doctor",
                // textColor: ColorsApp.primary,
                // onTap: () {
                //   Navigator.push(context, MaterialPageRoute(
                //     builder: (context) {
                //       return const DataByDoctorScreen();
                //     },
                //   ));
                // },
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
