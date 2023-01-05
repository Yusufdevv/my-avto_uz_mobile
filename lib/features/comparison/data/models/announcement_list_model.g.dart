// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementListModel _$AnnouncementListModelFromJson(
        Map<String, dynamic> json) =>
    AnnouncementListModel(
      contactAvailableFrom: json['contact_available_from'] as String? ?? '',
      contactAvailableTo: json['contact_available_to'] as String? ?? '',
      description: json['description'] as String? ?? '',
      discount: json['discount'] as String? ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generation: json['generation'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      isComparison: json['is_comparison'] as bool? ?? false,
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      make: json['make'] as String? ?? '',
      model: json['model'] as String? ?? '',
      price: json['price'] as String? ?? '',
      region: json['region'] as String? ?? '',
      user: json['user'] == null
          ? const UserEntity()
          : const UserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      viewsCount: json['views_count'] as int? ?? 0,
      year: json['year'] as int? ?? 0,
    );

Map<String, dynamic> _$AnnouncementListModelToJson(
        AnnouncementListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'gallery': instance.gallery,
      'region': instance.region,
      'description': instance.description,
      'year': instance.year,
      'views_count': instance.viewsCount,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'user': const UserConverter().toJson(instance.user),
      'price': instance.price,
      'is_comparison': instance.isComparison,
      'discount': instance.discount,
      'contact_available_from': instance.contactAvailableFrom,
      'contact_available_to': instance.contactAvailableTo,
      'is_wishlisted': instance.isWishlisted,
    };
