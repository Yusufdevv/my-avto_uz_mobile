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
      prosta: json['prosta'] as String? ?? '',
      region: json['region'] as String? ?? '',
    );

Map<String, dynamic> _$AnnouncementFilterModelToJson(
        AnnouncementFilterModel instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'is_new': instance.isNew,
      'prosta': instance.prosta,
      'region': instance.region,
    };
