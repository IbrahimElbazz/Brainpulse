import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/custom_circle_button_pop.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/features/data_by_doctor/presentation/widgets/row_text_with_text_field_get_data_by_doctor.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataByDoctorScreen extends StatelessWidget {
  const DataByDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16..w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const CustomCircleButtonPop(),
                    gapW(80),
                    Text(
                      'Enter points',
                      style: TextStyleApp.font18boldBlack,
                    ),
                  ],
                ),
                gapH(30),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  1',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  2',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  3',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  4',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  5',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  6',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  7',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  8',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '  9',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '10',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '11',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '12',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '13',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '14',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '15',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '16',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '17',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '18',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '19',
                ),
                gapH(10),
                RowTextWithTextFieldGetDataByDoctor(
                  controller: TextEditingController(),
                  number: '20',
                ),
                gapH(20),
                const CustomButton(
                  text: 'Send',
                  width: double.infinity,
                  height: 50,
                  textColor: Colors.blue,
                  borderColor: Colors.blue,
                  color: Colors.white,
                ),
                gapH(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
