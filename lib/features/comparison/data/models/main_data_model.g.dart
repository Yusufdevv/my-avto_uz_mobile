// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainDataModel _$MainDataModelFromJson(Map<String, dynamic> json) =>
    MainDataModel(
      bodyType: json['body_type'] as String? ?? '',
      color: json['color'] == null
          ? const ColorEntity()
          : const ColorConverter()
              .fromJson(json['color'] as Map<String, dynamic>?),
      driveType: json['drive_type'] as String? ?? '',
      gearboxType: json['gearbox_type'] as String? ?? '',
      generation: json['generation'] as String? ?? '',
      make: json['make'] as String? ?? '',
      model: json['model'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      contactAvailableFrom: json['contact_available_from'] as String? ?? '',
      contactAvailableTo: json['contact_available_to'] as String? ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      user: json['user'] == null
          ? const UserEntity()
          : const UserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$MainDataModelToJson(MainDataModel instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'body_type': instance.bodyType,
      'drive_type': instance.driveType,
      'gearbox_type': instance.gearboxType,
      'year': instance.year,
      'color': const ColorConverter().toJson(instance.color),
      'gallery': instance.gallery,
      'user': const UserConverter().toJson(instance.user),
      'contact_available_from': instance.contactAvailableFrom,
      'contact_available_to': instance.contactAvailableTo,
    };
