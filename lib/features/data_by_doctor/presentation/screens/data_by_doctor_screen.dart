import 'dart:convert';
import 'dart:developer';

import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/custom_circle_button_pop.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_cubit.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_state.dart';
import 'package:brain_pulse/features/data_by_doctor/presentation/screens/display_data.dart';
import 'package:brain_pulse/features/data_by_doctor/presentation/widgets/row_text_with_text_field_get_data_by_doctor.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataByDoctorScreen extends StatelessWidget {
  const DataByDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocListener<SendDataByDoctorCubit, SendDataByDoctorState>(
        listenWhen: (previous, current) {
          return current is FailureSendDataByDoctor ||
              current is LoadingSendDataByDoctor ||
              current is SuccessSendDataByDoctor;
        },
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loadingSendDataByDoctor: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                },
              );
            },
            failureSendDataByDoctor: (message) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Center(
                    child: Text(
                      'please try again',
                      style: Theme.of(context).textTheme.bodyMedium,

                    ),
                  ),
                ),
              );
            },
            successSendDataByDoctor: (data) {
              context.pop();
              List<dynamic> dataM = jsonDecode(data);
              Map<String, dynamic> prediction = dataM[0]['prediction'];
              log(prediction.toString());
              context.read<SendDataByDoctorCubit>().p1.clear();
              context.read<SendDataByDoctorCubit>().p2.clear();
              context.read<SendDataByDoctorCubit>().p3.clear();
              context.read<SendDataByDoctorCubit>().p4.clear();
              context.read<SendDataByDoctorCubit>().p5.clear();
              context.read<SendDataByDoctorCubit>().p6.clear();
              context.read<SendDataByDoctorCubit>().p7.clear();
              context.read<SendDataByDoctorCubit>().p8.clear();
              context.read<SendDataByDoctorCubit>().p9.clear();
              context.read<SendDataByDoctorCubit>().p10.clear();
              context.read<SendDataByDoctorCubit>().p11.clear();
              context.read<SendDataByDoctorCubit>().p12.clear();
              context.read<SendDataByDoctorCubit>().p13.clear();
              context.read<SendDataByDoctorCubit>().p14.clear();
              context.read<SendDataByDoctorCubit>().p15.clear();
              context.read<SendDataByDoctorCubit>().p16.clear();
              context.read<SendDataByDoctorCubit>().p17.clear();
              context.read<SendDataByDoctorCubit>().p18.clear();
              context.read<SendDataByDoctorCubit>().p19.clear();
              context.read<SendDataByDoctorCubit>().p20.clear();
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DisplayData(prediction: prediction);
                },
              ));
            },
          );
        },
        child: SafeArea(
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
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  gapH(30),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p1,
                    number: '  1',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p2,
                    number: '  2',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p3,
                    number: '  3',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p4,
                    number: '  4',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p5,
                    number: '  5',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p6,
                    number: '  6',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p7,
                    number: '  7',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p8,
                    number: '  8',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p9,
                    number: '  9',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p10,
                    number: '10',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p11,
                    number: '11',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p12,
                    number: '12',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p13,
                    number: '13',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p14,
                    number: '14',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p15,
                    number: '15',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p16,
                    number: '16',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p17,
                    number: '17',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p18,
                    number: '18',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p19,
                    number: '19',
                  ),
                  gapH(10),
                  RowTextWithTextFieldGetDataByDoctor(
                    controller: context.read<SendDataByDoctorCubit>().p20,
                    number: '20',
                  ),
                  gapH(20),
                  CustomButton(
                    onTap: () {
                      context.read<SendDataByDoctorCubit>().sendDataByDoctor();
                    },
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
      ),
    );
  }
}
