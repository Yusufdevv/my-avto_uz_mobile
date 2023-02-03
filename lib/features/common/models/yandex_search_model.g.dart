// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yandex_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YandexSearchModel _$YandexSearchModelFromJson(Map<String, dynamic> json) =>
    YandexSearchModel(
      features: (json['features'] as List<dynamic>?)
              ?.map((e) =>
                  const FeatureConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$YandexSearchModelToJson(YandexSearchModel instance) =>
    <String, dynamic>{
      'features':
          instance.features.map(const FeatureConverter().toJson).toList(),
    };

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) => FeatureModel(
      type: json['type'] as String? ?? '',
      geometry: json['geometry'] == null
          ? const GeometryEntity()
          : const GeometryConverter()
              .fromJson(json['geometry'] as Map<String, dynamic>?),
      properties: json['properties'] == null
          ? const PropertyEntity()
          : const PropertyConverter()
              .fromJson(json['properties'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$FeatureModelToJson(FeatureModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'geometry': const GeometryConverter().toJson(instance.geometry),
      'properties': const PropertyConverter().toJson(instance.properties),
    };

GeometryModel _$GeometryModelFromJson(Map<String, dynamic> json) =>
    GeometryModel(
      type: json['type'] as String? ?? '',
      coordinates: (json['coordinates'] as List<dynamic>?)
              ?.map((e) => e as num)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GeometryModelToJson(GeometryModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      name: json['name'] as String? ?? '',
      boundedBy: (json['bounded_by'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>).map((e) => e as num).toList())
              .toList() ??
          const [],
      geocoderMetaData: json['GeocoderMetaData'] == null
          ? const GeocoderMetaDataEntity()
          : const GeocoderMetaDataConverter()
              .fromJson(json['GeocoderMetaData'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bounded_by': instance.boundedBy,
      'GeocoderMetaData':
          const GeocoderMetaDataConverter().toJson(instance.geocoderMetaData),
    };

GeocoderMetaDataModel _$GeocoderMetaDataModelFromJson(
        Map<String, dynamic> json) =>
    GeocoderMetaDataModel(
      precision: json['precision'] as String? ?? '',
      text: json['text'] as String? ?? '',
      kind: json['kind'] as String? ?? '',
    );

Map<String, dynamic> _$GeocoderMetaDataModelToJson(
        GeocoderMetaDataModel instance) =>
    <String, dynamic>{
      'precision': instance.precision,
      'text': instance.text,
      'kind': instance.kind,
    };
