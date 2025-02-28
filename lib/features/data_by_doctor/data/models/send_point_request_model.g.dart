// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_point_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendPointRequestModel _$SendPointRequestModelFromJson(
        Map<String, dynamic> json) =>
    SendPointRequestModel(
      arr: (json['arr'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$SendPointRequestModelToJson(
        SendPointRequestModel instance) =>
    <String, dynamic>{
      'arr': instance.arr,
    };
