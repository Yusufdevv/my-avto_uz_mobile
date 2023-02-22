// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gearbox_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GearboxTypeModel _$GearboxTypeModelFromJson(Map<String, dynamic> json) =>
    GearboxTypeModel(
      id: json['id'] as int? ?? -1,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$GearboxTypeModelToJson(GearboxTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
