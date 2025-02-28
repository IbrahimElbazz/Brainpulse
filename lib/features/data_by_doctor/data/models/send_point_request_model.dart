import 'package:json_annotation/json_annotation.dart';

part 'sent_point_request_model.g.dart';

@JsonSerializable()
class SendPointRequestModel {
  List<int> arr;

  SendPointRequestModel({required this.arr});

  factory SendPointRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SentPointRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SentPointRequestModelToJson(this);
}
