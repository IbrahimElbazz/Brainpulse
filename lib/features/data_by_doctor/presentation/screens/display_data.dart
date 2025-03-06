import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/features/data_by_doctor/presentation/screens/save_and_create_patient.dart';
import 'package:brain_pulse/features/home/presentation/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({super.key, required this.prediction});
  final Map<String, dynamic> prediction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'result',
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'predicted Class :     ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      prediction['predictedClass'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                gapH(20),
                Row(
                  children: [
                    Text(
                      'gpd : ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      prediction['gpd'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'grda : ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      prediction['grda'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'lpd : ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      prediction['lpd'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'lrda : ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      prediction['lrda'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'seizure : ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      prediction['seizure'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'other : ',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      prediction['other'],
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 90.h,
                  ),
                  child: CustomButton(
                    width: double.infinity,
                    height: 80.h,
                    text: "Save and Add patient",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SaveAndCreatePatient(
                            prediction: prediction,
                          );
                        },
                      ));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                  ),
                  child: CustomButton(
                    text: "cancel",
                    onTap: () {
                      context.pop();
                      context.pop();
                    },
                    width: double.infinity,
                    height: 80.h,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
