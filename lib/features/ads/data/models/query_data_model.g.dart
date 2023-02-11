// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryDataModel _$QueryDataModelFromJson(Map<String, dynamic> json) =>
    QueryDataModel(
      bodyType: json['body_type'] as int?,
      driveType: json['drive_type'] as int?,
      gearboxType: json['gearbox_type'] as int?,
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
