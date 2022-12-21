// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modification_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModificationTypeModel _$ModificationTypeModelFromJson(
        Map<String, dynamic> json) =>
    ModificationTypeModel(
      id: json['id'] as int? ?? 0,
      power: json['power'] as String? ?? '',
      volume: json['volume'] as String? ?? '',
    );

Map<String, dynamic> _$ModificationTypeModelToJson(
        ModificationTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'power': instance.power,
      'volume': instance.volume,
    };
