// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_patient_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPatientRequestModel _$AddPatientRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddPatientRequestModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      age: (json['age'] as num?)?.toInt(),
      points: (json['points'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AddPatientRequestModelToJson(
        AddPatientRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'age': instance.age,
      'description': instance.description,
      'points': instance.points,
    };
