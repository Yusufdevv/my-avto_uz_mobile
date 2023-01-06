// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elastic_region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElasticRegionModel _$ElasticRegionModelFromJson(Map<String, dynamic> json) =>
    ElasticRegionModel(
      title: json['title'] as String? ?? '',
      id: json['id'] as int? ?? 0,
    );

Map<String, dynamic> _$ElasticRegionModelToJson(ElasticRegionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
