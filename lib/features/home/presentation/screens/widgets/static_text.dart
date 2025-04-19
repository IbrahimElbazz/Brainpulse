import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaticText extends StatelessWidget {
  const StaticText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello doctor',
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
      ],
    );
  }
}
