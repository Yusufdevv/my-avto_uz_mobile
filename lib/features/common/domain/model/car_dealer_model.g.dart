// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_dealer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDealerModel _$CarDealerModelFromJson(Map<String, dynamic> json) =>
    CarDealerModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      contactFrom: json['contact_from'] as String? ?? '',
      contactTo: json['contact_to'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      district: json['district'] as int? ?? 0,
      avatar: json['avatar'] as String? ?? '',
      carCount: json['car_count'] as int? ?? 0,
    );

Map<String, dynamic> _$CarDealerModelToJson(CarDealerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'avatar': instance.avatar,
      'description': instance.description,
      'phone_number': instance.phoneNumber,
      'contact_from': instance.contactFrom,
      'contact_to': instance.contactTo,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'district': instance.district,
      'car_count': instance.carCount,
    };
