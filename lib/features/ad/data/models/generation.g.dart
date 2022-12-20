// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerationModel _$GenerationModelFromJson(Map<String, dynamic> json) =>
    GenerationModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      yearBegin: json['year_begin'] as int? ?? 0,
      yearEnd: json['year_end'] as int? ?? 0,
      modelId: json['model'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$GenerationModelToJson(GenerationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year_begin': instance.yearBegin,
      'year_end': instance.yearEnd,
      'model': instance.modelId,
      'logo': instance.logo,
    };
