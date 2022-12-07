// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
      id: json['id'] as int? ?? 0,
      viewCount: json['view_count'] as int? ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      year: json['year'] as int? ?? 0,
      make: json['make'] as String? ?? '',
      model: json['model'] as String? ?? '',
      generation: json['generation'] as String? ?? '',
      region: json['region'] as String? ?? '',
      description: json['description'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      user: json['user'] == null
          ? const CarUserEntity()
          : const CarUserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
      price: json['price'] as String? ?? '',
    );

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'images': instance.images,
      'region': instance.region,
      'description': instance.description,
      'year': instance.year,
      'view_count': instance.viewCount,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'user': const CarUserConverter().toJson(instance.user),
      'is_wishlisted': instance.isWishlisted,
      'price': instance.price,
    };
