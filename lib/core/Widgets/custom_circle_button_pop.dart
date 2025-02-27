import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleButtonPop extends StatelessWidget {
  const CustomCircleButtonPop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 45.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            size: 25,
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}
