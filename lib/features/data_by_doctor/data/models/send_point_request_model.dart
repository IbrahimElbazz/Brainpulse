import 'package:json_annotation/json_annotation.dart';

part 'send_point_request_model.g.dart';

@JsonSerializable()
class SendPointRequestModel {
  List<int> arr;

  SendPointRequestModel({required this.arr});
  Map<String, dynamic> toJson() => _$SendPointRequestModelToJson(this);
}
