// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engine_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarEngineTypeModel _$RentCarEngineTypeModelFromJson(
        Map<String, dynamic> json) =>
    RentCarEngineTypeModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$RentCarEngineTypeModelToJson(
        RentCarEngineTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
