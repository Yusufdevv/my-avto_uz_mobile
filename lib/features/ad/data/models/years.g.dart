// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'years.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearsModel _$YearsModelFromJson(Map<String, dynamic> json) => YearsModel(
      id: json['id'] as int? ?? -1,
      years: (json['years'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const <int>[],
      model: json['model'] as int? ?? -1,
    );

Map<String, dynamic> _$YearsModelToJson(YearsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'years': instance.years,
      'model': instance.model,
    };
