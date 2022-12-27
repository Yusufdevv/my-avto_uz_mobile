// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarUserModel _$CarUserModelFromJson(Map<String, dynamic> json) => CarUserModel(
      id: json['id'] as int? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      name: json['name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
    );

Map<String, dynamic> _$CarUserModelToJson(CarUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'name': instance.name,
      'avatar': instance.avatar,
    };
