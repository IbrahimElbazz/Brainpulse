// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_point_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendPointResponseModel _$SendPointResponseModelFromJson(
        Map<String, dynamic> json) =>
    SendPointResponseModel(
      predicition: json['predicition'] == null
          ? null
          : Predicition.fromJson(json['predicition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendPointResponseModelToJson(
        SendPointResponseModel instance) =>
    <String, dynamic>{
      'predicition': instance.predicition,
    };

Predicition _$PredicitionFromJson(Map<String, dynamic> json) => Predicition(
      predictedClass: json['predictedClass'] as String?,
      probabilities: json['probabilities'] == null
          ? null
          : Probabilities.fromJson(
              json['probabilities'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PredicitionToJson(Predicition instance) =>
    <String, dynamic>{
      'predictedClass': instance.predictedClass,
      'probabilities': instance.probabilities,
    };

Probabilities _$ProbabilitiesFromJson(Map<String, dynamic> json) =>
    Probabilities(
      gpd: json['gpd'] as String?,
      grda: json['grda'] as String?,
      lpd: json['lpd'] as String?,
      lrda: json['lrda'] as String?,
      other: json['other'] as String?,
      seizure: json['seizure'] as String?,
    );

Map<String, dynamic> _$ProbabilitiesToJson(Probabilities instance) =>
    <String, dynamic>{
      'gpd': instance.gpd,
      'grda': instance.grda,
      'lpd': instance.lpd,
      'lrda': instance.lrda,
      'other': instance.other,
      'seizure': instance.seizure,
    };
