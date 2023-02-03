import 'package:auto/features/common/entities/yandex_search_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'yandex_search_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class YandexSearchModel extends YandexSearchEntity {
  const YandexSearchModel({
    required super.features,
  });

  factory YandexSearchModel.fromJson(Map<String, dynamic> json) =>
      _$YandexSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$YandexSearchModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FeatureModel extends FeatureEntity {
  const FeatureModel({
    required super.type,
    required super.geometry,
    required super.properties,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GeometryModel extends GeometryEntity {
  const GeometryModel({
    required super.type,
    required super.coordinates,
  });

  factory GeometryModel.fromJson(Map<String, dynamic> json) =>
      _$GeometryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PropertyModel extends PropertyEntity {
  const PropertyModel({
    required super.name,
    required super.boundedBy,
    required super.geocoderMetaData,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GeocoderMetaDataModel extends GeocoderMetaDataEntity {
  const GeocoderMetaDataModel({
    required super.precision,
    required super.text,
    required super.kind,
  });

  factory GeocoderMetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$GeocoderMetaDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeocoderMetaDataModelToJson(this);
}
