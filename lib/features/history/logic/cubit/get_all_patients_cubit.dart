import 'package:brain_pulse/features/history/data/model/get_all_patients_response.dart';
import 'package:brain_pulse/features/history/data/repo/get_all_patients_repo.dart';
import 'package:brain_pulse/features/history/logic/cubit/get_all_patients_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllPatientsCubit extends Cubit<GetAllPatientsState> {
  GetAllPatientsCubit(this._getAllPatientsRepo)
      : super(const GetAllPatientsState.initial());

  final GetAllPatientsRepo _getAllPatientsRepo;

  final int itemPerPage = 10;
  int page = 1;
  List<GetAllPatientsResponse> displayData = [];

  getAllPatients() async {
    emit(
      const GetAllPatientsState.loadingGetAllPatients(),
    );
    final response =
        await _getAllPatientsRepo.getAllPatients(page, itemPerPage);
    response.when(
      success: (data) {
        displayData.addAll(data);
        emit(GetAllPatientsState.successGetAllPatients(data));
      },
      failure: (message) {
        emit(GetAllPatientsState.errorGetAllPatients(errorMessage: message));
      },
    );
  }

  void nextPage() {
    page++;
    getAllPatients();
  }
}
