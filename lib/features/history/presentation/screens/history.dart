import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/core/di/dependency_injection.dart';
import 'package:brain_pulse/features/history/logic/cubit/get_all_patients_cubit.dart';
import 'package:brain_pulse/features/history/logic/cubit/get_all_patients_state.dart';
import 'package:brain_pulse/features/history/presentation/widgets/user_card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    context.read<GetAllPatientsCubit>().getAllPatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        surfaceTintColor: Colors.white,
        title: const Text(
          'History',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const GapH(height: 10),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey[300]!,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: ColorsApp.blue,
                    ),
                  ),
                  hintText: 'search in history',
                  hintStyle: TextStyleApp.styleText(
                      15, Colors.grey, FontWeight.normal),
                  fillColor: const Color(0xffFDFDFF),
                ),
              ),
              const GapH(height: 10),
              BlocBuilder<GetAllPatientsCubit, GetAllPatientsState>(
                buildWhen: (previous, current) {
                  return current is LoadingGetAllPatients ||
                      current is ErrorGetAllPatients ||
                      current is SuccessGetAllPatients;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    successGetAllPatients: (getAllPatientsResponse) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: getAllPatientsResponse.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return UserCardInfo(
                            name:
                                "${getAllPatientsResponse[index].firstName} ${getAllPatientsResponse[index].lastName}",
                            phone: getAllPatientsResponse[index].phone ?? "",
                          );
                        },
                      );
                    },
                    loadingGetAllPatients: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorGetAllPatients: (errorMessage) {
                      return Center(child: Text(errorMessage));
                    },
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
