// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainDataModel _$MainDataModelFromJson(Map<String, dynamic> json) =>
    MainDataModel(
      bodyType: json['body_type'] as String? ?? '',
      color: json['color'] as String? ?? '',
      driveType: json['drive_type'] as String? ?? '',
      gearboxType: json['gearbox_type'] as String? ?? '',
      generation: json['generation'] as String? ?? '',
      make: json['make'] as String? ?? '',
      model: json['model'] as String? ?? '',
      year: json['year'] as int? ?? 0,
    );

Map<String, dynamic> _$MainDataModelToJson(MainDataModel instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'body_type': instance.bodyType,
      'drive_type': instance.driveType,
      'gearbox_type': instance.gearboxType,
      'year': instance.year,
      'color': instance.color,
    };
