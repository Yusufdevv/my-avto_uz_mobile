// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'] as int? ?? 0,
      lastName: json['last_name'] as String? ?? '',
      firstName: json['firs_name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      region: json['region'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      dateJoined: json['date_joined'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
      isDealer: json['is_dealer'] as bool? ?? false,
      isStaff: json['is_staff'] as bool? ?? false,
      isSuperuser: json['is_superuser'] as bool? ?? false,
      lastLogin: json['last_login'] as String? ?? '',
      username: json['username'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firs_name': instance.firstName,
      'last_name': instance.lastName,
      'full_name': instance.fullName,
      'email': instance.email,
      'image': instance.image,
      'region': instance.region,
      'phone_number': instance.phoneNumber,
      'is_dealer': instance.isDealer,
      'is_active': instance.isActive,
      'is_staff': instance.isStaff,
      'is_superuser': instance.isSuperuser,
      'last_login': instance.lastLogin,
      'date_joined': instance.dateJoined,
    };
