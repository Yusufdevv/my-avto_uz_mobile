// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_in_marks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarsInMarksModel _$CarsInMarksModelFromJson(Map<String, dynamic> json) =>
    CarsInMarksModel(
      id: json['id'] as int? ?? 0,
      make: json['make'] == null
          ? const CarMakeEntity()
          : const CarMakeConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
      district: json['district'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0,
      price: json['price'] as String? ?? '',
      locationUrl: json['location_url'] as String? ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      color: json['color'] as String? ?? '',
      absoluteCarName: json['absolute_car_name'] as String? ?? '',
      bodyType: json['body_type'] as int? ?? 0,
      contactAvailableFrom: json['contact_available_from'] as String? ?? '',
      contactAvailableTo: json['contact_available_to'] as String? ?? '',
      contactEmail: json['contact_email'] as String? ?? '',
      contactName: json['contact_name'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      contactViewsCount: json['contact_views_count'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      dealer: json['dealer'] == null
          ? const DealerSingleEntity()
          : const DealerCardConvert()
              .fromJson(json['dealer'] as Map<String, dynamic>?),
      descriptionRu: json['description_ru'] as String? ?? '',
      descriptionUz: json['description_uz'] as String? ?? '',
      discount: json['discount'] as String? ?? '',
      distanceTraveled: json['distance_traveled'] as int? ?? 0,
      driveType: json['drive_type'] as int? ?? 0,
      engineType: json['engine_type'] as int? ?? 0,
      expiredAt: json['expired_at'] as String? ?? '',
      gearboxType: json['gearbox_type'] as int? ?? 0,
      generation: json['generation'] as int? ?? 0,
      isNew: json['is_new'] as bool? ?? false,
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? false,
      licenceType: json['licence_type'] as String? ?? '',
      mileageImage: json['mileage_image'] as String? ?? '',
      model: json['model'] == null
          ? const CarModelEntity()
          : const CarModelConverter()
              .fromJson(json['model'] as Map<String, dynamic>?),
      moderationStatus: json['moderation_status'] as String? ?? '',
      modificationType: json['modification_type'] as int? ?? 0,
      ownership: json['ownership'] as String? ?? '',
      publishedAt: json['published_at'] as String? ?? '',
      purchaseDate: json['purchase_date'] as String? ?? '',
      region: json['region'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      registeredInUzbekistan:
          json['registered_in_uzbekistan'] as bool? ?? false,
      registrationCertificate:
          json['registration_certificate'] as String? ?? '',
      registrationPlate: json['registration_plate'] as String? ?? '',
      registrationSerialNumber:
          json['registration_serial_number'] as String? ?? '',
      registrationVin: json['registration_vin'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      user: json['user'] == null
          ? const CarUserEntity()
          : const CarUserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      userType: json['user_type'] as String? ?? '',
      viewsCount: json['views_count'] as int? ?? 0,
      year: json['year'] as int? ?? 0,
      isWishlisted: json['is_wishlisted'] as bool? ?? false,
      isComparison: json['is_comparison'] as bool? ?? false,
      isRentWithPurchase: json['is_rent_with_purchase'] as bool? ?? false,
    );

Map<String, dynamic> _$CarsInMarksModelToJson(CarsInMarksModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'views_count': instance.viewsCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'moderation_status': instance.moderationStatus,
      'gallery': instance.gallery,
      'year': instance.year,
      'user': const CarUserConverter().toJson(instance.user),
      'absolute_car_name': instance.absoluteCarName,
      'licence_type': instance.licenceType,
      'ownership': instance.ownership,
      'purchase_date': instance.purchaseDate,
      'description': instance.description,
      'description_uz': instance.descriptionUz,
      'description_ru': instance.descriptionRu,
      'is_registered_locally': instance.isRegisteredLocally,
      'color': instance.color,
      'contact_name': instance.contactName,
      'contact_email': instance.contactEmail,
      'contact_phone': instance.contactPhone,
      'contact_available_from': instance.contactAvailableFrom,
      'contact_available_to': instance.contactAvailableTo,
      'location_url': instance.locationUrl,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'distance_traveled': instance.distanceTraveled,
      'mileage_image': instance.mileageImage,
      'registration_vin': instance.registrationVin,
      'registration_plate': instance.registrationPlate,
      'registration_certificate': instance.registrationCertificate,
      'registration_serial_number': instance.registrationSerialNumber,
      'registered_in_uzbekistan': instance.registeredInUzbekistan,
      'user_type': instance.userType,
      'is_new': instance.isNew,
      'price': instance.price,
      'discount': instance.discount,
      'currency': instance.currency,
      'published_at': instance.publishedAt,
      'contact_views_count': instance.contactViewsCount,
      'expired_at': instance.expiredAt,
      'make': const CarMakeConverter().toJson(instance.make),
      'model': const CarModelConverter().toJson(instance.model),
      'generation': instance.generation,
      'body_type': instance.bodyType,
      'drive_type': instance.driveType,
      'engine_type': instance.engineType,
      'gearbox_type': instance.gearboxType,
      'modification_type': instance.modificationType,
      'region': const RegionConverter().toJson(instance.region),
      'district': instance.district,
      'dealer': const DealerCardConvert().toJson(instance.dealer),
      'is_wishlisted': instance.isWishlisted,
      'is_comparison': instance.isComparison,
      'is_rent_with_purchase': instance.isRentWithPurchase,
    };
