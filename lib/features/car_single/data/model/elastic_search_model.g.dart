// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elastic_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElasticSearchModel _$ElasticSearchModelFromJson(Map<String, dynamic> json) =>
    ElasticSearchModel(
      id: json['id'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      region: json['region'] == null
          ? const ElasticRegionEntity()
          : const ElasticRegionConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      distanceTraveled: json['distance_traveled'] as int? ?? 0,
      carModel: json['car_model'] == null
          ? const ElasticCarModelEntity()
          : const ElasticCarModelEntityConverter()
              .fromJson(json['car_model'] as Map<String, dynamic>?),
      price: (json['price'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ElasticSearchModelToJson(ElasticSearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'car_model':
          const ElasticCarModelEntityConverter().toJson(instance.carModel),
      'gallery': instance.gallery,
      'price': instance.price,
      'currency': instance.currency,
      'distance_traveled': instance.distanceTraveled,
      'region': const ElasticRegionConverter().toJson(instance.region),
      'description': instance.description,
    };
