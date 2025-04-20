// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_patients_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetAllPatientsResponseAdapter
    extends TypeAdapter<GetAllPatientsResponse> {
  @override
  final int typeId = 0;

  @override
  GetAllPatientsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetAllPatientsResponse(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      phone: fields[2] as String?,
      age: fields[3] as int?,
      history: (fields[4] as List?)?.cast<History>(),
    );
  }

  @override
  void write(BinaryWriter writer, GetAllPatientsResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetAllPatientsResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 1;

  @override
  History read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History(
      points: (fields[0] as List?)?.cast<int>(),
      createdat: fields[1] as String?,
      description: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.points)
      ..writeByte(1)
      ..write(obj.createdat)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
