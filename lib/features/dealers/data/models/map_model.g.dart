// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapModel _$MapModelFromJson(Map<String, dynamic> json) => MapModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      contactFrom: json['contact_from'] as String? ?? '',
      contactTo: json['contact_to'] as String? ?? '',
      locationUrl: json['location_url'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      carCount: json['car_count'] as int? ?? 0,
      district: json['district'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$MapModelToJson(MapModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'phone_number': instance.phoneNumber,
      'avatar': instance.avatar,
      'contact_from': instance.contactFrom,
      'contact_to': instance.contactTo,
      'location_url': instance.locationUrl,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'car_count': instance.carCount,
      'district': const RegionConverter().toJson(instance.district),
    };
