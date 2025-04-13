import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedContainerOnBoarding extends StatelessWidget {
  const AnimatedContainerOnBoarding({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? const Color(0xFF0CAFB4) : Colors.grey[200],
      ),
      width: active ? 37.w : 10.w,
      height: 10.h,
    );
  }
}
