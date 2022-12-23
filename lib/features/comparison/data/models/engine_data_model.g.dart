// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engine_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EngineDataModel _$EngineDataModelFromJson(Map<String, dynamic> json) =>
    EngineDataModel(
      engineType: json['engine_type'] as String? ?? '',
      power: json['power'] as String? ?? '',
      volume: json['volume'] as String? ?? '',
    );

Map<String, dynamic> _$EngineDataModelToJson(EngineDataModel instance) =>
    <String, dynamic>{
      'engine_type': instance.engineType,
      'power': instance.power,
      'volume': instance.volume,
    };
