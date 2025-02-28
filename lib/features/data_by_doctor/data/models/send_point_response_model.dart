import 'package:json_annotation/json_annotation.dart';

part 'send_point_response_model.g.dart';

@JsonSerializable()
class SendPointResponseModel {
  Predicition? predicition;

  SendPointResponseModel({this.predicition});
  factory SendPointResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SendPointResponseModelFromJson(json);
}

@JsonSerializable()
class Predicition {
  String? predictedClass;
  Probabilities? probabilities;

  Predicition({this.predictedClass, this.probabilities});
  factory Predicition.fromJson(Map<String, dynamic> json) =>
      _$PredicitionFromJson(json);

  Map<String, dynamic> toJson() => _$PredicitionToJson(this);
}

@JsonSerializable()
class Probabilities {
  String? gpd;
  String? grda;
  String? lpd;
  String? lrda;
  String? other;
  String? seizure;

  Probabilities(
      {this.gpd, this.grda, this.lpd, this.lrda, this.other, this.seizure});

  factory Probabilities.fromJson(Map<String, dynamic> json) =>
      _$ProbabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$ProbabilitiesToJson(this);
}
