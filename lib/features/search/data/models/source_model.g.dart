// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceModel _$SourceModelFromJson(Map<String, dynamic> json) => SourceModel(
      id: json['id'] as int? ?? 0,
      absoluteCarName: json['absolute_car_name'] as String? ?? '',
    );

Map<String, dynamic> _$SourceModelToJson(SourceModel instance) =>
    <String, dynamic>{
      'absolute_car_name': instance.absoluteCarName,
      'id': instance.id,
    };
