// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'years.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearsModel _$YearsModelFromJson(Map<String, dynamic> json) => YearsModel(
      id: json['id'] as int? ?? 0,
      yearBegin: json['year_begin'] as int? ?? 0,
      yearEnd: json['year_end'] as int? ?? 0,
      modelId: json['model'] as int? ?? 0,
    );

Map<String, dynamic> _$YearsModelToJson(YearsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year_begin': instance.yearBegin,
      'year_end': instance.yearEnd,
      'model': instance.modelId,
    };
