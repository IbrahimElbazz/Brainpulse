import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/Widgets/mytextfield.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/add_patient_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_cubit.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveAndCreatePatient extends StatelessWidget {
  const SaveAndCreatePatient({super.key, required this.prediction});
  final List<dynamic> prediction;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    double parsePrediction(dynamic value) {
      final parsed = double.tryParse(value.toString());
      return parsed ?? 0.0;
    }

    return Scaffold(
      backgroundColor: ColorsApp.white,
      appBar: AppBar(
        backgroundColor: ColorsApp.primary,
        title: Text(
          'Add patient',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 22,
                color: ColorsApp.white,
              ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<SendDataByDoctorCubit, SendDataByDoctorState>(
        listenWhen: (previous, current) {
          return current is FailureAddPatient ||
              current is LoadingAddPatient ||
              current is SuccessAddPatient;
        },
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loadingAddPatient: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorsApp.primary,
                    ),
                  );
                },
              );
            },
            failureAddPatient: (message) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ColorsApp.darkRed,
                  content: Center(
                    child: Text(
                      'please try again',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorsApp.white,
                          ),
                    ),
                  ),
                ),
              );
            },
            successAddPatient: (data) {
              context.pop();
              context.pop();
              context.pop();
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ColorsApp.green,
                  content: Center(
                    child: Text(
                      'add success',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorsApp.white,
                          ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GapH(height: 20),
                  Text(
                    'Name :',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorsApp.black,
                        ),
                  ),
                  gapH(8),
                  SizedBox(
                    child: MyTextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      hint: 'Enter patient name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter patient name';
                        }
                        return null;
                      },
                    ),
                  ),
                  gapH(20),
                  Text(
                    'Phone :',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorsApp.black,
                        ),
                  ),
                  gapH(8),
                  SizedBox(
                    child: MyTextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      hint: 'Enter phone number',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  gapH(20),
                  Text(
                    'Age :',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorsApp.black,
                        ),
                  ),
                  gapH(8),
                  SizedBox(
                    child: MyTextField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      hint: 'Enter age',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter age';
                        }
                        return null;
                      },
                    ),
                  ),
                  gapH(20),
                  Text(
                    'Description :',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorsApp.black,
                        ),
                  ),
                  gapH(8),
                  TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    minLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Enter patient description',
                      hintStyle: TextStyle(color: ColorsApp.grey),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: ColorsApp.grey300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: ColorsApp.primary,
                        ),
                      ),
                    ),
                  ),
                  gapH(20),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 40.h,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorsApp.primary,
                            ColorsApp.primary.withOpacity(0.8),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: ColorsApp.primary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (prediction.length == 6) {
                                // ✅ الحالة العادية - من Doctor أو ملف 6 قيم
                                context
                                    .read<SendDataByDoctorCubit>()
                                    .addPatient(
                                      AddPatientRequestModel(
                                        age: int.parse(ageController.text),
                                        name: nameController.text,
                                        phoneNumber: phoneController.text,
                                        gpd: parsePrediction(prediction[0]),
                                        grda: parsePrediction(prediction[1]),
                                        ipd: parsePrediction(prediction[2]),
                                        irda: parsePrediction(prediction[3]),
                                        seizure: parsePrediction(prediction[4]),
                                        other: parsePrediction(prediction[5]),
                                      ),
                                    );
                              } else if (prediction.length == 1 &&
                                  prediction[0] == "Other") {
                                // ✅ الحالة الخاصة - لما السيرفر يرجّع "Other" فقط
                                context
                                    .read<SendDataByDoctorCubit>()
                                    .addPatient(
                                      AddPatientRequestModel(
                                        age: int.parse(ageController.text),
                                        name: nameController.text,
                                        phoneNumber: phoneController.text,
                                        gpd: 0.0,
                                        grda: 0.0,
                                        ipd: 0.0,
                                        irda: 0.0,
                                        seizure: 0.0,
                                        other: 1.0,
                                      ),
                                    );
                              } else {
                                // ❌ حالة خاطئة
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("❌ بيانات التحليل غير مكتملة")),
                                );
                              }
                            }
                            // if (formKey.currentState!.validate()) {
                            //   context.read<SendDataByDoctorCubit>().addPatient(
                            //         AddPatientRequestModel(
                            //           age: int.parse(ageController.text),
                            //           name: nameController.text,
                            //           phoneNumber: phoneController.text,
                            //           gpd: prediction[0].toDouble(),

                            //           grda: prediction[1].toDouble(),
                            //           ipd: prediction[2].toDouble(),
                            //           irda: prediction[3].toDouble(),
                            //           seizure: prediction[4].toDouble(),
                            //           other: prediction[5].toDouble(),
                            //         ),
                            //       );
                            // }
                          },
                          borderRadius: BorderRadius.circular(16.r),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Save",
                                  style: TextStyle(
                                    color: ColorsApp.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
