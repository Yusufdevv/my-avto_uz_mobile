// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerSingleModel _$DealerSingleModelFromJson(Map<String, dynamic> json) =>
    DealerSingleModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      dealerType: json['dealer_type'] == null
          ? const DealerTypeEntity()
          : const DealerTypeConverter()
              .fromJson(json['dealer_type'] as Map<String, dynamic>?),
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      phoneNumber: json['phone_number'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String? ?? '',
      contactTo: json['contact_to'] as String? ?? '',
      contactFrom: json['contact_from'] as String? ?? '',
      carCount: json['car_count'] as int? ?? 0,
      category: json['category'],
      district: json['district'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      avatar: json['avatar'] as String? ?? '',
      locationUrl: json['location_url'] as String? ?? '',
    );

Map<String, dynamic> _$DealerSingleModelToJson(DealerSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'phone_number': instance.phoneNumber,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'address': instance.address,
      'contact_from': instance.contactFrom,
      'contact_to': instance.contactTo,
      'location_url': instance.locationUrl,
      'category': instance.category,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'car_count': instance.carCount,
      'district': const RegionConverter().toJson(instance.district),
      'dealer_type': const DealerTypeConverter().toJson(instance.dealerType),
      'gallery': instance.gallery,
    };
