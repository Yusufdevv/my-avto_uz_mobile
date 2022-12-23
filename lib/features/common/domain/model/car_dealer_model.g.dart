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
      phone: json['phone'] as String? ?? '',
      contactFrom: json['contact_from'] as String? ?? '',
      contactTo: json['contact_to'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      district: json['district'] == null
          ? const CarDistrictEntity()
          : const CarDistrictConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      type: json['type'],
      carCount: json['car_count'] as int? ?? 0,
    );

Map<String, dynamic> _$CarDealerModelToJson(CarDealerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'phone': instance.phone,
      'contact_from': instance.contactFrom,
      'contact_to': instance.contactTo,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'district': const CarDistrictConverter().toJson(instance.district),
      'type': instance.type,
      'car_count': instance.carCount,
    };
