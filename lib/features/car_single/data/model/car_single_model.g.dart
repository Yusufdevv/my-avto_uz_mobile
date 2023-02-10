// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSingleModel _$CarSingleModelFromJson(Map<String, dynamic> json) =>
    CarSingleModel(
      description: json['description'] as String? ?? '',
      contactAvailableFrom: json['contact_available_from'] as String? ?? '',
      absoluteCarName: json['absolute_car_name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      model: json['model'] == null
          ? const RentCarModelsEntity()
          : const RentCarModelsConverter()
              .fromJson(json['model'] as Map<String, dynamic>?),
      currency: json['currency'] as String? ?? '',
      color: json['color'] as String? ?? '',
      price: json['price'] as String? ?? '',
      engineType: json['engine_type'] == null
          ? const RentCarEngineTypeEntity()
          : const RentCarEngineTypeConverter()
              .fromJson(json['engine_type'] as Map<String, dynamic>?),
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      bodyType: json['body_type'] == null
          ? const RentCarBodyTypeEntity()
          : const RentCarBodyTypeConverter()
              .fromJson(json['body_type'] as Map<String, dynamic>?),
      contactAvailableTo: json['contact_available_to'] as String? ?? '',
      contactEmail: json['contact_email'] as String? ?? '',
      contactName: json['contact_name'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      damagedParts: (json['damaged_parts'] as List<dynamic>?)
              ?.map((e) => const DamagedPartsConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      distanceTraveled: json['distance_traveled'] as int? ?? 0,
      driveType: json['drive_type'] == null
          ? const RentCarDriveTypeEntity()
          : const RentCarDriveTypeConverter()
              .fromJson(json['drive_type'] as Map<String, dynamic>?),
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      gearboxType: json['gearbox_type'] == null
          ? const GearboxTypeEntity()
          : const GearboxTypeEntityConverter()
              .fromJson(json['gearbox_type'] as Map<String, dynamic>?),
      generation: json['generation'] == null
          ? const RentCarGenerationEntity()
          : const RentCarGenerationConverter()
              .fromJson(json['generation'] as Map<String, dynamic>?),
      isMine: json['is_mine'] as bool? ?? false,
      isNew: json['is_new'] as bool? ?? false,
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? false,
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      licenceType: json['licence_type'] as String? ?? '',
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      make: json['make'] == null
          ? const RentCarMakeEntity()
          : const RentCarMakeConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
      modificationType: json['modification_type'] == null
          ? const ModificationTypeEntity()
          : const ModificationTypeEntityConverter()
              .fromJson(json['modification_type'] as Map<String, dynamic>?),
      ownership: json['ownership'] as String? ?? '',
      publishedAt: json['published_at'] as String? ?? '',
      purchaseDate: json['purchase_date'] as String? ?? '',
      registeredInUzbekistan:
          json['registered_in_uzbekistan'] as bool? ?? false,
      registrationCertificate:
          json['registration_certificate'] as String? ?? '',
      registrationPlate: json['registration_plate'] as String? ?? '',
      registrationSerialNumber:
          json['registration_serial_number'] as String? ?? '',
      registrationVin: json['registration_vin'] as String? ?? '',
      user: json['user'] == null
          ? const CarUserEntity()
          : const CarUserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      userType: json['user_type'] as String? ?? '',
      viewsCount: json['views_count'] as int? ?? 0,
      todayViewedCount: json['today_viewed_count'] as int? ?? 0,
      callCount: json['call_count'] as int? ?? 0,
      wishlistCount: json['wishlist_count'] as int? ?? 0,
      isComparison: json['is_comparison'] as bool? ?? false,
      year: json['year'] as int? ?? 0,
      isExpired: json['is_expired'] as bool? ?? false,
      expiredAt: json['expired_at'] as String? ?? '',
      isRentWithPurchase: json['is_rent_with_purchase'] as bool? ?? false,
      priceAnalytics: json['price_analytics'] == null
          ? const PriceAnalyticsEntity()
          : const PriceAnalyticsConverter()
              .fromJson(json['price_analytics'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$CarSingleModelToJson(CarSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': const RentCarMakeConverter().toJson(instance.make),
      'model': const RentCarModelsConverter().toJson(instance.model),
      'absolute_car_name': instance.absoluteCarName,
      'price': instance.price,
      'currency': instance.currency,
      'published_at': instance.publishedAt,
      'year': instance.year,
      'distance_traveled': instance.distanceTraveled,
      'color': instance.color,
      'generation':
          const RentCarGenerationConverter().toJson(instance.generation),
      'body_type': const RentCarBodyTypeConverter().toJson(instance.bodyType),
      'drive_type':
          const RentCarDriveTypeConverter().toJson(instance.driveType),
      'engine_type':
          const RentCarEngineTypeConverter().toJson(instance.engineType),
      'gearbox_type':
          const GearboxTypeEntityConverter().toJson(instance.gearboxType),
      'modification_type': const ModificationTypeEntityConverter()
          .toJson(instance.modificationType),
      'licence_type': instance.licenceType,
      'ownership': instance.ownership,
      'purchase_date': instance.purchaseDate,
      'description': instance.description,
      'is_registered_locally': instance.isRegisteredLocally,
      'registration_vin': instance.registrationVin,
      'registration_plate': instance.registrationPlate,
      'registration_certificate': instance.registrationCertificate,
      'registration_serial_number': instance.registrationSerialNumber,
      'registered_in_uzbekistan': instance.registeredInUzbekistan,
      'user': const CarUserConverter().toJson(instance.user),
      'contact_name': instance.contactName,
      'contact_email': instance.contactEmail,
      'contact_phone': instance.contactPhone,
      'contact_available_from': instance.contactAvailableFrom,
      'contact_available_to': instance.contactAvailableTo,
      'is_new': instance.isNew,
      'gallery': instance.gallery,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'is_mine': instance.isMine,
      'views_count': instance.viewsCount,
      'today_viewed_count': instance.todayViewedCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'damaged_parts': instance.damagedParts
          .map(const DamagedPartsConverter().toJson)
          .toList(),
      'user_type': instance.userType,
      'is_wishlisted': instance.isWishlisted,
      'wishlist_count': instance.wishlistCount,
      'call_count': instance.callCount,
      'is_comparison': instance.isComparison,
      'is_rent_with_purchase': instance.isRentWithPurchase,
      'is_expired': instance.isExpired,
      'expired_at': instance.expiredAt,
      'price_analytics':
          const PriceAnalyticsConverter().toJson(instance.priceAnalytics),
    };
