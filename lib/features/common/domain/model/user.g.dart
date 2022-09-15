// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      phone: json['phone'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      pk: json['pk'] as int? ?? 0,
      lastName: json['last_name'] as String? ?? '',
      middleName: json['middle_name'] as String? ?? '',
      role: json['role'] as int? ?? 0,
      userName: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'pk': instance.pk,
      'username': instance.userName,
      'last_name': instance.lastName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'phone': instance.phone,
      'role': instance.role,
    };
