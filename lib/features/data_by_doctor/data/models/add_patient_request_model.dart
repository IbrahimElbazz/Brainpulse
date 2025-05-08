import 'package:json_annotation/json_annotation.dart';
part 'add_patient_request_model.g.dart';

@JsonSerializable()
class AddPatientRequestModel {
  String? name;
  String? phone;
  int? age;
  String? description;
  List<double>? points;

  AddPatientRequestModel(
      {this.name, this.phone, this.age, this.points, this.description});
  Map<String, dynamic> toJson() => _$AddPatientRequestModelToJson(this);
}
