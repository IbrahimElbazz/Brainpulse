import 'package:brain_pulse/features/history/data/model/get_all_patients_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_patients_state.freezed.dart';

@freezed
class GetAllPatientsState<T> with _$GetAllPatientsState<T> {
  const factory GetAllPatientsState.initial() = _Initial;
  const factory GetAllPatientsState.loadingGetAllPatients() =
      LoadingGetAllPatients;
  const factory GetAllPatientsState.successGetAllPatients(
    List<GetAllPatientsResponse> getAllPatientsResponse,
  ) = SuccessGetAllPatients;
  const factory GetAllPatientsState.errorGetAllPatients(
      {required String errorMessage}) = ErrorGetAllPatients;
}
