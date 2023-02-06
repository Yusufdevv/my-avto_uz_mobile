import 'package:auto/features/common/models/yandex_search_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class YandexSearchEntity extends Equatable {
  @FeatureConverter()
  final List<FeatureEntity> features;

  const YandexSearchEntity({
    this.features = const [],
  });

  @override
  List<Object?> get props => [features];
}

class FeatureEntity extends Equatable {
  final String type;
  @GeometryConverter()
  final GeometryEntity geometry;
  @PropertyConverter()
  final PropertyEntity properties;

  const FeatureEntity({
    this.type = '',
    this.geometry = const GeometryEntity(),
    this.properties = const PropertyEntity(),
  });

  @override
  List<Object?> get props => [
        type,
        geometry,
        properties,
      ];
}

class FeatureConverter
    implements JsonConverter<FeatureEntity, Map<String, dynamic>?> {
  const FeatureConverter();

  @override
  FeatureEntity fromJson(Map<String, dynamic>? json) =>
      FeatureModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(FeatureEntity object) => {};
}

class GeometryEntity extends Equatable {
  final String type;
  final List<num> coordinates;

  const GeometryEntity({
    this.type = '',
    this.coordinates = const [],
  });

  @override
  List<Object?> get props => [type, coordinates];
}

class GeometryConverter
    implements JsonConverter<GeometryEntity, Map<String, dynamic>?> {
  const GeometryConverter();

  @override
  GeometryEntity fromJson(Map<String, dynamic>? json) =>
      GeometryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(GeometryEntity object) => {};
}

class PropertyEntity extends Equatable {
  final String name;
  final List<List<num>> boundedBy;
  @GeocoderMetaDataConverter()
  @JsonKey(name: 'GeocoderMetaData')
  final GeocoderMetaDataEntity geocoderMetaData;

  const PropertyEntity({
    this.name = '',
    this.boundedBy = const [],
    this.geocoderMetaData = const GeocoderMetaDataEntity(),
  });

  @override
  List<Object?> get props => [
        name,
        boundedBy,
        geocoderMetaData,
      ];
}

class PropertyConverter
    implements JsonConverter<PropertyEntity, Map<String, dynamic>?> {
  const PropertyConverter();

  @override
  PropertyEntity fromJson(Map<String, dynamic>? json) =>
      PropertyModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(PropertyEntity object) => {};
}

class GeocoderMetaDataEntity extends Equatable {
  final String precision;
  final String text;
  final String kind;

  const GeocoderMetaDataEntity({
    this.precision = '',
    this.text = '',
    this.kind = '',
  });

  @override
  List<Object?> get props => [
        precision,
        text,
        kind,
      ];
}

class GeocoderMetaDataConverter
    implements JsonConverter<GeocoderMetaDataEntity, Map<String, dynamic>?> {
  const GeocoderMetaDataConverter();

  @override
  GeocoderMetaDataEntity fromJson(Map<String, dynamic>? json) =>
      GeocoderMetaDataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(GeocoderMetaDataEntity object) => {};
}
