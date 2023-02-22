// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriveTypeModel _$DriveTypeModelFromJson(Map<String, dynamic> json) =>
    DriveTypeModel(
      id: json['id'] as int? ?? -1,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$DriveTypeModelToJson(DriveTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
