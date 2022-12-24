// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarDriveTypeModel _$RentCarDriveTypeModelFromJson(
        Map<String, dynamic> json) =>
    RentCarDriveTypeModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$RentCarDriveTypeModelToJson(
        RentCarDriveTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
