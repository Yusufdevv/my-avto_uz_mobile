// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryDataModel _$QueryDataModelFromJson(Map<String, dynamic> json) =>
    QueryDataModel(
      bodyType: json['body_type'] as int? ?? 0,
      driveType: json['drive_type'] as int? ?? 0,
      gearboxType: json['gearbox_type'] as int? ?? 0,
      engineType: json['engine_type'] as int? ?? 0,
      isNew: json['is_new'] as bool?,
      priceFrom: json['price_from'] as int? ?? 0,
      priceTo: json['price_to'] as int? ?? 0,
      regionIn: json['region_in'] as String? ?? '',
      yearFrom: json['year_from'] as int? ?? 0,
      yearTo: json['year_to'] as int? ?? 0,
    );

Map<String, dynamic> _$QueryDataModelToJson(QueryDataModel instance) =>
    <String, dynamic>{
      'body_type': instance.bodyType,
      'drive_type': instance.driveType,
      'engine_type': instance.engineType,
      'gearbox_type': instance.gearboxType,
      'region_in': instance.regionIn,
      'is_new': instance.isNew,
      'price_from': instance.priceFrom,
      'price_to': instance.priceTo,
      'year_from': instance.yearFrom,
      'year_to': instance.yearTo,
    };
