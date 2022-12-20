// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engine_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineTypeModel _$EngineTypeModelFromJson(Map<String, dynamic> json) =>
    EngineTypeModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$EngineTypeModelToJson(EngineTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
