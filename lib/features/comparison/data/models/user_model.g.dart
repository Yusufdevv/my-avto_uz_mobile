// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      avatar: json['avatar'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      image: json['image'] ?? '',
      name: json['name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'avatar': instance.avatar,
      'full_name': instance.fullName,
      'image': instance.image,
    };
