// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoModel _$AutoModelFromJson(Map<String, dynamic> json) => AutoModel(
      id: json['id'] as int? ?? -1,
      carBodyType: json['car_body_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['car_body_type'] as Map<String, dynamic>?),
      carDriveType: json['car_drive_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['car_drive_type'] as Map<String, dynamic>?),
      carEngineType: json['car_engine_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['car_engine_type'] as Map<String, dynamic>?),
      carGearboxType: json['car_gearbox_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['car_gearbox_type'] as Map<String, dynamic>?),
      carGeneration: json['car_generation'] == null
          ? const CarGenerationEntity()
          : const CarGenerationConverter()
              .fromJson(json['car_generation'] as Map<String, dynamic>),
      carMake: json['car_make'] == null
          ? const CarMakeEntity()
          : const CarMakeConverter()
              .fromJson(json['car_make'] as Map<String, dynamic>?),
      carModel: json['car_model'] == null
          ? const CarModelEntity()
          : const CarModelConverter()
              .fromJson(json['car_model'] as Map<String, dynamic>?),
      carModificationType: json['car_modification_type'] == null
          ? const CarModificationTypeEntity()
          : const CarModificationTypeConverter()
              .fromJson(json['car_modification_type'] as Map<String, dynamic>?),
      carYear: json['car_year'] as int? ?? 0,
      contactEmail: json['contact_email'] as String? ?? '',
      expiredAt: json['expired_at'] as String? ?? '',
      contactName: json['contact_name'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      dealer: json['dealer'],
      description: json['description'] as String? ?? '',
      distanceTraveled: json['distance_traveled'] as int? ?? 0,
      district: json['district'] == null
          ? const CarDistrictEntity()
          : const CarDistrictConverter()
              .fromJson(json['district'] as Map<String, dynamic>?),
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isNew: json['is_new'] as bool? ?? false,
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? false,
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      licenceType: json['licence_type'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      ownership: json['ownership'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      publishedAt: json['published_at'] as String? ?? '',
      region: json['region'] == null
          ? const CarDistrictEntity()
          : const CarDistrictConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      registeredInUzbekistan:
          json['registered_in_uzbekistan'] as bool? ?? false,
      user: json['user'] == null
          ? const CarUserEntity()
          : const CarUserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      userType: json['user_type'] as String? ?? '',
      viewsCount: json['views_count'] as int? ?? 0,
      isComparison: json['is_comparison'] as bool? ?? false,
      discount: (json['discount'] as num?)?.toDouble() ?? -1,
      contactAvailableFrom: json['contact_available_from'] as String? ?? '',
      contactAvailableTo: json['contact_available_to'] as String? ?? '',
    );

Map<String, dynamic> _$AutoModelToJson(AutoModel instance) => <String, dynamic>{
      'id': instance.id,
      'car_make': const CarMakeConverter().toJson(instance.carMake),
      'car_model': const CarModelConverter().toJson(instance.carModel),
      'car_generation':
          const CarGenerationConverter().toJson(instance.carGeneration),
      'car_body_type': const TypeConverter().toJson(instance.carBodyType),
      'car_drive_type': const TypeConverter().toJson(instance.carDriveType),
      'car_engine_type': const TypeConverter().toJson(instance.carEngineType),
      'car_gearbox_type': const TypeConverter().toJson(instance.carGearboxType),
      'car_year': instance.carYear,
      'car_modification_type': const CarModificationTypeConverter()
          .toJson(instance.carModificationType),
      'region': const CarDistrictConverter().toJson(instance.region),
      'district': const CarDistrictConverter().toJson(instance.district),
      'user': const CarUserConverter().toJson(instance.user),
      'dealer': instance.dealer,
      'licence_type': instance.licenceType,
      'ownership': instance.ownership,
      'description': instance.description,
      'is_registered_locally': instance.isRegisteredLocally,
      'contact_name': instance.contactName,
      'contact_email': instance.contactEmail,
      'contact_phone': instance.contactPhone,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'distance_traveled': instance.distanceTraveled,
      'registered_in_uzbekistan': instance.registeredInUzbekistan,
      'user_type': instance.userType,
      'is_new': instance.isNew,
      'price': instance.price,
      'currency': instance.currency,
      'gallery': instance.gallery,
      'published_at': instance.publishedAt,
      'expired_at': instance.expiredAt,
      'views_count': instance.viewsCount,
      'is_wishlisted': instance.isWishlisted,
      'is_comparison': instance.isComparison,
      'discount': instance.discount,
      'contact_available_from': instance.contactAvailableFrom,
      'contact_available_to': instance.contactAvailableTo,
    };
