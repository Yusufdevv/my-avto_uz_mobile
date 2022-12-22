// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_lease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterLeaseModel _$RegisterLeaseModelFromJson(Map<String, dynamic> json) =>
    RegisterLeaseModel(
      additionalServices: (json['additional_services'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const [],
      endDate: json['end_date'] as String? ?? '',
      endLatitude: json['end_latitude'] as num? ?? 0,
      endLongitude: json['end_longitude'] as num? ?? 0,
      phoneNumber: json['phone_number'] as String? ?? '',
      rent: json['rent'] as int? ?? -1,
      startDate: json['start_date'] as String? ?? '',
      startLatitude: json['start_latitude'] as num? ?? 0,
      startLongitude: json['start_longitude'] as num? ?? 0,
      userName: json['user_name'] as String? ?? '',
    );

Map<String, dynamic> _$RegisterLeaseModelToJson(RegisterLeaseModel instance) =>
    <String, dynamic>{
      'rent': instance.rent,
      'user_name': instance.userName,
      'phone_number': instance.phoneNumber,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'start_longitude': instance.startLongitude,
      'start_latitude': instance.startLatitude,
      'end_longitude': instance.endLongitude,
      'end_latitude': instance.endLatitude,
      'additional_services': instance.additionalServices,
    };
