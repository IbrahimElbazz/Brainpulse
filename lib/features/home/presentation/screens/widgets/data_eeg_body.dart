import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_button.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/eeg_data_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataEegBody extends StatelessWidget {
  DataEegBody({
    super.key,
  });
  // EegModel? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const EegDataContainer(),
          CustomButton(text: "Save Result", width: 150.w, height: 40.h)
        ],
      ),
    );
  }
}
