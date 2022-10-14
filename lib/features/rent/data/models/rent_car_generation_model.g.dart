// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_car_generation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarGenerationModel _$RentCarGenerationModelFromJson(
        Map<String, dynamic> json) =>
    RentCarGenerationModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      yearBegin: json['year_begin'] as int? ?? 0,
      yearEnd: json['year_end'] as int? ?? 0,
      model: json['model'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$RentCarGenerationModelToJson(
        RentCarGenerationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year_begin': instance.yearBegin,
      'year_end': instance.yearEnd,
      'model': instance.model,
      'logo': instance.logo,
    };
