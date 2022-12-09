// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gearbox_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarGearboxTypeModel _$RentCarGearboxTypeModelFromJson(
        Map<String, dynamic> json) =>
    RentCarGearboxTypeModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$RentCarGearboxTypeModelToJson(
        RentCarGearboxTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
