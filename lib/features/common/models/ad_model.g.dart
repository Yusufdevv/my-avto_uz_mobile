// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdModel _$AdModelFromJson(Map<String, dynamic> json) => AdModel(
      id: json['id'] as int? ?? -1,
      make: json['make'] as String? ?? '',
      model: json['model'] as String? ?? '',
      generation: json['generation'] as String? ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      region: json['region'] as String? ?? '',
      description: json['description'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      viewCount: json['view_count'] as int? ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      user: json['user'] == null
          ? const CarUserEntity()
          : const CarUserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      price: json['price'] as num? ?? 0,
      isComparison: json['is_comparison'] as bool? ?? false,
      discount: json['discount'] as num? ?? 0,
      contactAvailableFrom: json['contact_available_from'] as String? ?? '',
      contactAvailableTo: json['contact_available_to'] as String? ?? '',
      isNew: json['is_new'] as bool? ?? false,
      userType: json['user_type'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      publishedAt: json['published_at'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      expiredAt: json['expired_at'] as String? ?? '',
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
    );

Map<String, dynamic> _$AdModelToJson(AdModel instance) => <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'gallery': instance.gallery,
      'region': instance.region,
      'description': instance.description,
      'year': instance.year,
      'view_count': instance.viewCount,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'user': const CarUserConverter().toJson(instance.user),
      'price': instance.price,
      'is_comparison': instance.isComparison,
      'discount': instance.discount,
      'contact_available_from': instance.contactAvailableFrom,
      'contact_available_to': instance.contactAvailableTo,
      'is_new': instance.isNew,
      'user_type': instance.userType,
      'currency': instance.currency,
      'published_at': instance.publishedAt,
      'created_at': instance.createdAt,
      'expired_at': instance.expiredAt,
      'is_wishlisted': instance.isWishlisted,
    };
