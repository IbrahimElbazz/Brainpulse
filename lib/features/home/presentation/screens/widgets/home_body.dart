import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/routing/routers.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const GapH(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Hallo doctor',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    "Electroencephalography (EEG) is a medical technique used to monitor and record electrical activity in the brain, helping doctors diagnose a variety of neurological disorders. Electrodes are placed on the scalp to pick up electrical signals generated by the activity of neurons. EEG is commonly used to diagnose epilepsy, sleep disorders, and changes in consciousness. Additionally, it can help evaluate conditions such as encephalitis, tumors, and brain injuries, making it a valuable tool in neurology",
                    textStyle: TextStyleApp.font14weight400colorGrey,
                    speed: const Duration(milliseconds: 20),
                  ),
                ],
                totalRepeatCount: 1,
              ),
              // Text(
              //     "Electroencephalography (EEG) is a medical technique used to monitor and record electrical activity in the brain, helping doctors diagnose a variety of neurological disorders. Electrodes are placed on the scalp to pick up electrical signals generated by the activity of neurons. EEG is commonly used to diagnose epilepsy, sleep disorders, and changes in consciousness. Additionally, it can help evaluate conditions such as encephalitis, tumors, and brain injuries, making it a valuable tool in neurology.",
              //     style: TextStyleApp.font14weight400colorGrey),
              Padding(
                padding: EdgeInsets.only(
                  top: 90.h,
                ),
                child: CustomButton(
                  width: double.infinity,
                  height: 80.h,
                  text: "By Hostpital",
                  onTap: () {
                    Navigator.pushNamed(context, Routes.getImage);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                ),
                child: CustomButton(
                  text: "By Helmat",
                  onTap: () {},
                  width: double.infinity,
                  height: 80.h,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
