import 'package:brain_pulse/core/Widgets/custom_circle_button_pop.dart';
import 'package:brain_pulse/core/helpers/spacing.dart';
import 'package:brain_pulse/features/history/data/model/get_all_patients_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key, required this.patientDetails});
  final GetAllPatientsResponse patientDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              gapH(10),
              Row(
                children: [
                  const CustomCircleButtonPop(),
                  gapW(70),
                  Text(
                    "${patientDetails.firstName} ${patientDetails.lastName}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              gapH(30),
              Row(
                children: [
                  Text(
                    'Phone :    ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    patientDetails.phone ?? "",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              gapH(10),
              Row(
                children: [
                  Text(
                    'age :    ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    patientDetails.age.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              gapH(10),
              Row(
                children: [
                  Text(
                    'history :    ',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: patientDetails.history?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(children: [
                        gapH(10),
                        Row(
                          children: [
                            const Spacer(),
                            Text(
                              patientDetails.history![index].createdat!
                                  .substring(0, 10),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            gapW(15),
                          ],
                        ),
                        Row(
                          children: [
                            gapW(20),
                            Text(
                              'gpd : ',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            gapW(10),
                            Text(
                              "${patientDetails.history![index].points![0].toString()} %",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            gapW(20),
                            Text(
                              'grda : ',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            gapW(10),
                            Text(
                              "${patientDetails.history![index].points![1].toString()} %",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            gapW(20),
                            Text(
                              'lpd : ',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            gapW(10),
                            Text(
                              "${patientDetails.history![index].points![2].toString()} %",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            gapW(20),
                            Text(
                              'lrda : ',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            gapW(10),
                            Text(
                              "${patientDetails.history![index].points![3].toString()} %",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            gapW(20),
                            Text(
                              'seizure : ',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            gapW(10),
                            Text(
                              "${patientDetails.history![index].points![4].toString()} %",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            gapW(20),
                            Text(
                              'other : ',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            gapW(10),
                            Text(
                              "${patientDetails.history![index].points![5].toString()} %",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
