import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/Widgets/mytextfield.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/add_patient_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_cubit.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_state.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveAndCreatePatient extends StatelessWidget {
  const SaveAndCreatePatient({super.key, required this.prediction});
  final List<dynamic> prediction;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Add patient',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22),
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
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                },
              );
            },
            failureAddPatient: (message) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      'please try again',
                      style: Theme.of(context).textTheme.bodyMedium,
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
                  backgroundColor: Colors.blue,
                  content: Center(
                    child: Text(
                      'add success',
                      style: Theme.of(context).textTheme.bodyMedium,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GapH(height: 20),
                Text(
                  'First name :',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                gapH(8),
                SizedBox(
                  height: 50.h,
                  child: MyTextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    hint: '',
                    validator: (p0) {},
                  ),
                ),
                gapH(20),
                Text(
                  'Phone :',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                gapH(8),
                SizedBox(
                  height: 50.h,
                  child: MyTextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    hint: '',
                    validator: (p0) {},
                  ),
                ),
                gapH(20),
                Text(
                  'Age :',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                gapH(8),
                SizedBox(
                  height: 50.h,
                  child: MyTextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    hint: '',
                    validator: (p0) {},
                  ),
                ),
                gapH(20),
                Text(
                  'Description :',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                gapH(8),
                TextField(
                    controller: descriptionController,
                    maxLines: 5,
                    minLines: 5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide(
                          color: ColorsApp.blue,
                        ),
                      ),
                    )),
                gapH(20),
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.h,
                  ),
                  child: CustomButton(
                    borderColor: Colors.blue,
                    width: double.infinity,
                    color: Colors.white,
                    textColor: Colors.blue,
                    height: 80.h,
                    text: "Save ",
                    onTap: () {
                      // final age = ageController.text.
                      context.read<SendDataByDoctorCubit>().addPatient(
                            AddPatientRequestModel(
                              age: int.parse(ageController.text),
                              description: descriptionController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              points: [
                                double.parse(prediction[0]),
                                double.parse(prediction[1]),
                                double.parse(prediction[2]),
                                double.parse(prediction[3]),
                                double.parse(prediction[4]),
                                double.parse(prediction[5]),
                              ],
                            ),
                          );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
