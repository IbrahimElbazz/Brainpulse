import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'get_all_patients_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class GetAllPatientsResponse extends HiveObject {
  @HiveField(0)
  String? firstName;
  @HiveField(1)
  String? lastName;
  @HiveField(2)
  String? phone;
  @HiveField(3)
  int? age;
  @HiveField(4)
  List<History>? history;

  GetAllPatientsResponse(
      {this.firstName, this.lastName, this.phone, this.age, this.history});

  factory GetAllPatientsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllPatientsResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: 1)
class History extends HiveObject {
  @HiveField(0)
  List<int>? points;
  @HiveField(1)
  String? createdat;
  @HiveField(2)
  String? description;

  History({this.points, this.createdat, this.description});

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}
