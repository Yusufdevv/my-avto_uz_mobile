// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryDataModel _$QueryDataModelFromJson(Map<String, dynamic> json) =>
    QueryDataModel(
      bodyType: const BodyTypeEntityConverter()
          .fromJson(json['body_type'] as Map<String, dynamic>?),
      driveType: const DriveTypeEntityConverter()
          .fromJson(json['drive_type'] as Map<String, dynamic>?),
      gearboxType: const GearboxTypeEntityConverter()
          .fromJson(json['gearbox_type'] as Map<String, dynamic>?),
      engineType: json['engine_type'] as int?,
      isNew: json['is_new'] as bool?,
      priceFrom: json['price_from'] as int?,
      priceTo: json['price_to'] as int?,
      regionIn: json['region_in'] as String?,
      yearFrom: json['year_from'] as int?,
      yearTo: json['year_to'] as int?,
    );

Map<String, dynamic> _$QueryDataModelToJson(QueryDataModel instance) =>
    <String, dynamic>{
      'body_type': _$JsonConverterToJson<Map<String, dynamic>?, BodyTypeEntity>(
          instance.bodyType, const BodyTypeEntityConverter().toJson),
      'drive_type':
          _$JsonConverterToJson<Map<String, dynamic>?, DriveTypeEntity>(
              instance.driveType, const DriveTypeEntityConverter().toJson),
      'engine_type': instance.engineType,
      'gearbox_type':
          _$JsonConverterToJson<Map<String, dynamic>?, GearboxTypeEntity>(
              instance.gearboxType, const GearboxTypeEntityConverter().toJson),
      'region_in': instance.regionIn,
      'is_new': instance.isNew,
      'price_from': instance.priceFrom,
      'price_to': instance.priceTo,
      'year_from': instance.yearFrom,
      'year_to': instance.yearTo,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
