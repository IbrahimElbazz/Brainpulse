// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_point_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendPointResponseModel _$SendPointResponseModelFromJson(
        Map<String, dynamic> json) =>
    SendPointResponseModel(
      prediction: json['prediction'] == null
          ? null
          : predictionData.fromJson(json['prediction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendPointResponseModelToJson(
        SendPointResponseModel instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
    };

predictionData _$predictionDataFromJson(Map<String, dynamic> json) =>
    predictionData(
      gpd: json['gpd'] as String?,
      grda: json['grda'] as String?,
      lpd: json['lpd'] as String?,
      lrda: json['lrda'] as String?,
      other: json['other'] as String?,
      seizure: json['seizure'] as String?,
      predictedClass: json['predictedClass'] as String?,
    );

Map<String, dynamic> _$predictionDataToJson(predictionData instance) =>
    <String, dynamic>{
      'gpd': instance.gpd,
      'grda': instance.grda,
      'lpd': instance.lpd,
      'lrda': instance.lrda,
      'other': instance.other,
      'seizure': instance.seizure,
      'predictedClass': instance.predictedClass,
    };
