// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerCardModel _$DealerCardModelFromJson(Map<String, dynamic> json) =>
    DealerCardModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      contactFrom: json['contact_from'] as String? ?? '',
      contactTo: json['contact_to'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      type: json['type'] as String? ?? '',
      carCount: json['carCount'] as int? ?? 0,
      avatar: json['avatar'] as String? ?? '',
      district: json['district'] as int? ?? 0,
    );

Map<String, dynamic> _$DealerCardModelToJson(DealerCardModel instance) =>
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
      'type': instance.type,
      'carCount': instance.carCount,
      'avatar': instance.avatar,
      'district': instance.district,
    };
