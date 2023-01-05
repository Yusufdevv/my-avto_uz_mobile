// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemModel _$SearchItemModelFromJson(Map<String, dynamic> json) =>
    SearchItemModel(
      year: json['year'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publishedAt: json['published_at'] as String? ?? '',
      isNew: json['is_new'] as bool? ?? false,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
      currency: json['currency'] as String? ?? '',
      userType: json['user_type'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      district: json['district'] == null
          ? const CarDistrictEntity()
          : const CarDistrictConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      user: json['user'] == null
          ? const CarUserEntity()
          : const CarUserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      model: json['model'] == null
          ? const CarModelEntity()
          : const CarModelConverter()
              .fromJson(json['model'] as Map<String, dynamic>?),
      dealer: json['dealer'],
      generation: json['generation'] == null
          ? const CarGenerationEntity()
          : const CarGenerationConverter()
              .fromJson(json['generation'] as Map<String, dynamic>),
      make: json['make'] == null
          ? const CarMakeEntity()
          : const CarMakeConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$SearchItemModelToJson(SearchItemModel instance) =>
    <String, dynamic>{
      'make': const CarMakeConverter().toJson(instance.make),
      'model': const CarModelConverter().toJson(instance.model),
      'generation': const CarGenerationConverter().toJson(instance.generation),
      'year': instance.year,
      'district': const CarDistrictConverter().toJson(instance.district),
      'user': const CarUserConverter().toJson(instance.user),
      'dealer': instance.dealer,
      'description': instance.description,
      'contact_phone': instance.contactPhone,
      'user_type': instance.userType,
      'is_new': instance.isNew,
      'price': instance.price,
      'currency': instance.currency,
      'gallery': instance.gallery,
      'published_at': instance.publishedAt,
      'is_wishlisted': instance.isWishlisted,
    };
