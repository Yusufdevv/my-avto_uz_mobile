// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateModel _$GenerateModelFromJson(Map<String, dynamic> json) =>
    GenerateModel(
      id: json['id'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
      model: json['model'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      yearBegin: json['year_begin'] as int? ?? 0,
      yearEnd: json['year_end'] as int? ?? 0,
    );

Map<String, dynamic> _$GenerateModelToJson(GenerateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year_begin': instance.yearBegin,
      'year_end': instance.yearEnd,
      'model': instance.model,
      'logo': instance.logo,
    };
