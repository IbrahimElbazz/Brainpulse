import 'package:brain_pulse/core/Theming/colors.dart';
import 'package:brain_pulse/core/Theming/text_style.dart';
import 'package:brain_pulse/core/Widgets/gap.dart';
import 'package:brain_pulse/features/history/logic/cubit/get_all_patients_cubit.dart';
import 'package:brain_pulse/features/history/logic/cubit/get_all_patients_state.dart';
import 'package:brain_pulse/features/history/presentation/screens/Patient_details.dart';
import 'package:brain_pulse/features/history/presentation/widgets/history_shimmer.dart';
import 'package:brain_pulse/features/history/presentation/widgets/user_card_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  late ScrollController _scrollController;

  @override
  void initState() {
    context.read<GetAllPatientsCubit>().getAllPatients();
    _scrollController = ScrollController();

    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          context.read<GetAllPatientsCubit>().nextPage();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const GapH(height: 10),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Ionicons.search,
                  ),
                  disabledBorder: OutlineInputBorder(
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
                      15, ColorsApp.grey500, FontWeight.normal),
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
                      final patientData =
                          context.read<GetAllPatientsCubit>().displayData;

                      return ListView.builder(
                        controller: _scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemCount: patientData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return PatientDetails(
                                    patientDetails: patientData[index],
                                  );
                                },
                              ));
                            },
                            child: UserCardInfo(
                              name:
                                  "${patientData[index].firstName} ${patientData[index].lastName}",
                              phone: patientData[index].phone ?? "",
                            ),
                          );
                        },
                      );
                    },
                    loadingGetAllPatients: () {
                      return const HistoryShimmer();
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
