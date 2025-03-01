import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_data_by_doctor_state.freezed.dart';

@freezed
class SendDataByDoctorState<T> with _$SendDataByDoctorState<T> {
  const factory SendDataByDoctorState.initial() = _Initial;
  const factory SendDataByDoctorState.loadingSendDataByDoctor() =
      LoadingSendDataByDoctor;
  const factory SendDataByDoctorState.successSendDataByDoctor(T data) =
      SuccessSendDataByDoctor<T>;
  const factory SendDataByDoctorState.failureSendDataByDoctor(
      {required String message}) = FailureSendDataByDoctor;
}
