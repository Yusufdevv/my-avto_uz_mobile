// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarUserModel _$CarUserModelFromJson(Map<String, dynamic> json) => CarUserModel(
      id: json['id'] as int? ?? -1,
      phoneNumber: json['phone_number'] as String? ?? '',
      email: json['email'] as String? ?? '',
      image: json['image'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
    );

Map<String, dynamic> _$CarUserModelToJson(CarUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'full_name': instance.fullName,
      'email': instance.email,
      'image': instance.image,
    };
