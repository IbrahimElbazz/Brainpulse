// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_patients_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllPatientsResponse _$GetAllPatientsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllPatientsResponse(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      age: (json['age'] as num?)?.toInt(),
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllPatientsResponseToJson(
        GetAllPatientsResponse instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'age': instance.age,
      'history': instance.history,
    };

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      points: (json['points'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      createdat: json['createdat'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'points': instance.points,
      'createdat': instance.createdat,
      'description': instance.description,
    };
