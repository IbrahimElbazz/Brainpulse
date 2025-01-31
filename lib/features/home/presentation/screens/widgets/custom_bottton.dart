import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottton extends StatelessWidget {
  const CustomBottton({super.key, this.ontap, required this.text});
  final void Function()? ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      splashColor: ColorsApp.blue,
      child: Container(
        width: double.infinity,
        height: 80.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: ColorsApp.grey),
        child: Center(
            child: Text(
          text,
          style: TextStyleApp.font14weight400colorGrey
              .copyWith(color: ColorsApp.white),
        )),
      ),
    );
  }
}
