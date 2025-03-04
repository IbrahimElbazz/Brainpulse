import 'package:json_annotation/json_annotation.dart';
part 'get_all_patients_response.g.dart';

@JsonSerializable()
class GetAllPatientsResponse {
  String? firstName;
  String? lastName;
  String? phone;
  int? age;
  List<History>? history;

  GetAllPatientsResponse(
      {this.firstName, this.lastName, this.phone, this.age, this.history});

  factory GetAllPatientsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllPatientsResponseFromJson(json);
}

@JsonSerializable()
class History {
  List<int>? points;
  String? createdat;
  String? description;

  History({this.points, this.createdat, this.description});

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
