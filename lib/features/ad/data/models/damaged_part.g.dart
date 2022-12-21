// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damaged_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DamagedPartModel _$DamagedPartModelFromJson(Map<String, dynamic> json) =>
    DamagedPartModel(
      part: json['part'] as String? ?? '',
      damageType: json['damage_type'] as String? ?? '',
    );

Map<String, dynamic> _$DamagedPartModelToJson(DamagedPartModel instance) =>
    <String, dynamic>{
      'part': instance.part,
      'damage_type': instance.damageType,
    };
