import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/features/home/data/model/eeg_model.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_bottton.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/eeg_data_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataEegBody extends StatelessWidget {
  DataEegBody({super.key, this.data});
  EegModel? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Column(
        children: [
          const EegDataContainer(),
          CustomBottton(text: "Save Result", width: 150.w, height: 40.h)
        ],
      ),
    );
  }
}
