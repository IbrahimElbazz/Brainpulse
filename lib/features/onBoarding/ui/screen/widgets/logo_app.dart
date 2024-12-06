import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoApp extends StatelessWidget {
  const LogoApp(
      {super.key, required this.width_logo, required this.width_logo_text});
  final double width_logo;
  final double width_logo_text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.jpeg', width: 50),
        SizedBox(
          width: 8.w,
        ),
        Text("Brain Pulse", style: TextStyleApp.logotext)
      ],
    );
  }
}
