// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damaged_parts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DamagedPartsModel _$DamagedPartsModelFromJson(Map<String, dynamic> json) =>
    DamagedPartsModel(
      damageType: json['damage_type'] as String? ?? '',
      part: json['part'] as String? ?? '',
    );

Map<String, dynamic> _$DamagedPartsModelToJson(DamagedPartsModel instance) =>
    <String, dynamic>{
      'part': instance.part,
      'damage_type': instance.damageType,
    };
