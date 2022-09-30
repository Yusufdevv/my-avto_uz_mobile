// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      password: json['password'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      email: json['email'] as String? ?? '',
      image: json['image'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      region: json['region'] as int? ?? 0,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'image': instance.image,
    };
