import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create Account",
          style: TextStyleApp.styleText(
              30, const Color(0xff247CFF), FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Sign up now and start exploring all that our",
          style:
              TextStyleApp.styleText(14, Colors.grey[700]!, FontWeight.normal),
        ),
        Text(
          "app has to offer. We're excited to welcome\nyou to our community!",
          style:
              TextStyleApp.styleText(14, Colors.grey[700]!, FontWeight.normal),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
