import 'package:json_annotation/json_annotation.dart';
part 'add_patient_request_model.g.dart';

@JsonSerializable()
class AddPatientRequestModel {
  String? firstName;
  String? lastName;
  String? phone;
  int? age;
  String? description;
  List<double>? points;

  AddPatientRequestModel(
      {this.firstName,
      this.lastName,
      this.phone,
      this.age,
      this.points,
      this.description});
  Map<String, dynamic> toJson() => _$AddPatientRequestModelToJson(this);
}
