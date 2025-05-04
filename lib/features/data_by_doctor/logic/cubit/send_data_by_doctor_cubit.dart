import 'dart:developer';

import 'package:brain_pulse/features/data_by_doctor/data/models/add_patient_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/data/models/send_point_request_model.dart';
import 'package:brain_pulse/features/data_by_doctor/data/repo/doctor_repo.dart';
import 'package:brain_pulse/features/data_by_doctor/logic/cubit/send_data_by_doctor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendDataByDoctorCubit extends Cubit<SendDataByDoctorState> {
  SendDataByDoctorCubit(this._sendPointRepo, this._addPatientRepo)
      : super(const SendDataByDoctorState.initial());

  final SendPointRepo _sendPointRepo;
  final AddPatientRepo _addPatientRepo;

  TextEditingController p1 = TextEditingController();
  TextEditingController p2 = TextEditingController();
  TextEditingController p3 = TextEditingController();
  TextEditingController p4 = TextEditingController();
  TextEditingController p5 = TextEditingController();
  TextEditingController p6 = TextEditingController();
  TextEditingController p7 = TextEditingController();
  TextEditingController p8 = TextEditingController();
  TextEditingController p9 = TextEditingController();
  TextEditingController p10 = TextEditingController();
  TextEditingController p11 = TextEditingController();
  TextEditingController p12 = TextEditingController();
  TextEditingController p13 = TextEditingController();
  TextEditingController p14 = TextEditingController();
  TextEditingController p15 = TextEditingController();
  TextEditingController p16 = TextEditingController();
  TextEditingController p17 = TextEditingController();
  TextEditingController p18 = TextEditingController();
  TextEditingController p19 = TextEditingController();
  TextEditingController p20 = TextEditingController();
  sendDataByDoctor() async {
    emit(const SendDataByDoctorState.loadingSendDataByDoctor());
    final response = await _sendPointRepo.sendDataByDoctor(
      SendPointRequestModel(
        arr: [
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
          '2',
        ],
        // p1: p1.text,
        // p2: p2.text,
        // p3: p3.text,
        // p4: p4.text,
        // p5: p5.text,
        // p6: p6.text,
        // p7: p7.text,
        // p8: p8.text,
        // p9: p9.text,
        // p10: p10.text,
        // p11: p11.text,
        // p12: p12.text,
        // p13: p13.text,
        // p14: p14.text,
        // p15: p15.text,
        // p16: p16.text,
        // p17: p17.text,
        // p18: p18.text,
        // p19: p19.text,
        // p20: p20.text,
      ),
    );

    response.when(
      success: (data) {
        emit(
          SendDataByDoctorState.successSendDataByDoctor(data),
        );
      },
      failure: (error) {
        log(error.toString());
        emit(
          SendDataByDoctorState.failureSendDataByDoctor(
              message: error.toString()),
        );
      },
    );
  }

  addPatient(AddPatientRequestModel request) async {
    emit(const SendDataByDoctorState.loadingAddPatient());
    final response = await _addPatientRepo.addPatient(request);
    response.when(
      success: (data) {
        emit(SendDataByDoctorState.successAddPatient(data));
      },
      failure: (message) {
        emit(SendDataByDoctorState.failureAddPatient(message: message));
      },
    );
  }
}
