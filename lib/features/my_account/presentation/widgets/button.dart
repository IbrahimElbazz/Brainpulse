import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonAcc extends StatelessWidget {
  const CustomButtonAcc({
    required this.color,
    required this.text,
    required this.onTap,
    super.key,
    this.textColor,
    this.textSized,
    this.withBorder,
  });
  final Color color;
  final Color? textColor;
  final double? textSized;
  final String text;
  final void Function() onTap;
  final bool? withBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.h,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: withBorder ?? true
                ? BorderSide(
                    color: textColor ?? Colors.white,
                  )
                : BorderSide.none,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: textSized ?? 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
