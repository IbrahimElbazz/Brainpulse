import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/helpers/extentions.dart';
import 'package:brain_pulse/features/history/logic/cubit/get_all_patients_cubit.dart';
import 'package:brain_pulse/features/history/logic/cubit/get_all_patients_state.dart';
import 'package:brain_pulse/features/history/presentation/screens/Patient_details.dart';
import 'package:brain_pulse/features/history/presentation/widgets/history_shimmer.dart';
import 'package:brain_pulse/features/history/presentation/widgets/user_card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ionicons/ionicons.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetAllPatientsCubit>().getAllPatients();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        surfaceTintColor: Colors.white,
        title: Text('Patient record',
            style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const GapH(height: 10),
            TextField(
              controller: _searchController,
              onChanged: (value) {
                context.read<GetAllPatientsCubit>().searchPatients(value);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Ionicons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: ColorsApp.primary),
                ),
                hintText: 'Search in history',
                hintStyle: TextStyleApp.styleText(
                    15, ColorsApp.grey500, FontWeight.normal),
                fillColor: const Color(0xffFDFDFF),
              ),
            ),
            const GapH(height: 10),
            Expanded(
              child: BlocConsumer<GetAllPatientsCubit, GetAllPatientsState>(
                listenWhen: (previous, current) {
                  return current is ErrorDeletePatient ||
                      current is SuccessDeletePatient ||
                      current is LoadingDeletePatient;
                },
                listener: (context, state) {
                  if (state is ErrorDeletePatient) {
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                            child: Text(state.errorMessage,
                                style: const TextStyle(color: Colors.white))),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  if (state is SuccessDeletePatient) {
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Center(
                            child: Text('Patient deleted successfully',
                                style: TextStyle(color: Colors.white))),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                  if (state is LoadingDeletePatient) {
                    showDialog(
                      context: context,
                      builder: (context) => Center(
                        child: CircularProgressIndicator(
                          color: ColorsApp.primary,
                        ),
                      ),
                    );
                  }
                },
                buildWhen: (previous, current) {
                  return current is LoadingGetAllPatients ||
                      current is ErrorGetAllPatients ||
                      current is SuccessGetAllPatients;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    successGetAllPatients: (_, __) {
                      final displayData =
                          context.read<GetAllPatientsCubit>().displayData;

                      if (displayData.isEmpty) {
                        return Center(
                          child: Text(
                            'No patients found',
                            style: TextStyleApp.styleText(
                                16, ColorsApp.grey500, FontWeight.normal),
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: displayData.length,
                        itemBuilder: (context, index) {
                          final patient = displayData[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Slidable(
                              key: ValueKey(patient.phone ?? index),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible:
                                    DismissiblePane(onDismissed: () {}),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {
                                      context
                                          .read<GetAllPatientsCubit>()
                                          .deletePatient(patient.phone!);
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return PatientDetails(
                                        patientDetails: patient,
                                      );
                                    },
                                  ));
                                },
                                child: UserCardInfo(
                                  name:
                                      "${patient.firstName} ${patient.lastName}",
                                  phone: patient.phone ?? "",
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    loadingGetAllPatients: () => const HistoryShimmer(),
                    errorGetAllPatients: (errorMessage) =>
                        Center(child: Text(errorMessage)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
