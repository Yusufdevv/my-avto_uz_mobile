// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementFilterModel _$AnnouncementFilterModelFromJson(
        Map<String, dynamic> json) =>
    AnnouncementFilterModel(
      make: json['make'] as int?,
      model: json['model'] as int?,
      isNew: json['is_new'] as bool?,
      bodyType: json['body_type'] as int?,
      gearboxType: json['gearbox_type'] as int?,
      driveType: json['drive_type'] as int?,
      priceFrom: json['price_from'] as int?,
      priceTo: json['price_to'] as int?,
      yearFrom: json['year_from'] as int?,
      yearTo: json['year_to'] as int?,
      region__in: json['region__in'] as String?,
    );

Map<String, dynamic> _$AnnouncementFilterModelToJson(
        AnnouncementFilterModel instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'is_new': instance.isNew,
      'body_type': instance.bodyType,
      'gearbox_type': instance.gearboxType,
      'drive_type': instance.driveType,
      'price_from': instance.priceFrom,
      'price_to': instance.priceTo,
      'year_from': instance.yearFrom,
      'year_to': instance.yearTo,
      'region__in': instance.region__in,
    };
