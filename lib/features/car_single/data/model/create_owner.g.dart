// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOwnerModel _$CreateOwnerModelFromJson(Map<String, dynamic> json) =>
    CreateOwnerModel(
      id: json['id'] as int? ?? 0,
      user: json['user'] as int? ?? 0,
      announcement: json['announcement'] as int? ?? 361,
      additionalInfo: json['additional_info'] as String? ?? '',
      driverlicenceBack: json['driver_license_back'] as String? ?? '',
      driverLicenceFront: json['driver_license_front'] as String? ?? '',
      technicalPasswordBack: json['technical_passport_back'] as String? ?? '',
      technicalPasswordFront: json['technical_passport_front'] as String? ?? '',
    );

Map<String, dynamic> _$CreateOwnerModelToJson(CreateOwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'announcement': instance.announcement,
      'technical_passport_front': instance.technicalPasswordFront,
      'technical_passport_back': instance.technicalPasswordBack,
      'driver_license_front': instance.driverLicenceFront,
      'driver_license_back': instance.driverlicenceBack,
      'additional_info': instance.additionalInfo,
      'user': instance.user,
    };
