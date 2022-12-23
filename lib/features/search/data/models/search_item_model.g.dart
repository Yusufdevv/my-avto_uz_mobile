// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchItemModel _$SearchItemModelFromJson(Map<String, dynamic> json) =>
    SearchItemModel(
      carYear: json['car_year'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      publishedAt: json['published_at'] as String? ?? '',
      isNew: json['is_new'] as bool? ?? false,
      price: json['price'] as int? ?? 0,
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
      carModel: json['car_model'] == null
          ? const CarModelEntity()
          : const CarModelConverter()
              .fromJson(json['car_model'] as Map<String, dynamic>?),
      dealer: json['dealer'] == null
          ? const CarDealerEntity()
          : const CarDealerConverter()
              .fromJson(json['dealer'] as Map<String, dynamic>?),
      carGeneration: json['car_generation'] == null
          ? const CarGenerationEntity()
          : const CarGenerationConverter()
              .fromJson(json['car_generation'] as Map<String, dynamic>),
      carMake: json['car_make'] == null
          ? const CarMakeEntity()
          : const CarMakeConverter()
              .fromJson(json['car_make'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$SearchItemModelToJson(SearchItemModel instance) =>
    <String, dynamic>{
      'car_year': instance.carYear,
      'description': instance.description,
      'gallery': instance.gallery,
      'published_at': instance.publishedAt,
      'is_new': instance.isNew,
      'price': instance.price,
      'currency': instance.currency,
      'is_wishlisted': instance.isWishlisted,
      'user_type': instance.userType,
      'contact_phone': instance.contactPhone,
      'district': const CarDistrictConverter().toJson(instance.district),
      'user': const CarUserConverter().toJson(instance.user),
      'car_model': const CarModelConverter().toJson(instance.carModel),
      'dealer': const CarDealerConverter().toJson(instance.dealer),
      'car_generation':
          const CarGenerationConverter().toJson(instance.carGeneration),
      'car_make': const CarMakeConverter().toJson(instance.carMake),
    };
