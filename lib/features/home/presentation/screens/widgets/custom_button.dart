import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.width,
      required this.height});
  final void Function()? onTap;
  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
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
