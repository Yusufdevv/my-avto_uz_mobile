// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoModel _$AutoModelFromJson(Map<String, dynamic> json) => AutoModel(
      id: json['id'] as int? ?? -1,
      bodyType: json['body_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['body_type'] as Map<String, dynamic>?),
      driveType: json['drive_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['drive_type'] as Map<String, dynamic>?),
      engineType: json['engine_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['engine_type'] as Map<String, dynamic>?),
      gearboxType: json['gearbox_type'] == null
          ? const TypeEntity()
          : const TypeConverter()
              .fromJson(json['gearbox_type'] as Map<String, dynamic>?),
      generation: json['generation'] == null
          ? const CarGenerationEntity()
          : const CarGenerationConverter()
              .fromJson(json['generation'] as Map<String, dynamic>),
      make: json['make'] == null
          ? const CarMakeEntity()
          : const CarMakeConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
      model: json['model'] == null
          ? const CarModelEntity()
          : const CarModelConverter()
              .fromJson(json['model'] as Map<String, dynamic>?),
      modificationType: json['modification_type'] == null
          ? const CarModificationTypeEntity()
          : const CarModificationTypeConverter()
              .fromJson(json['modification_type'] as Map<String, dynamic>?),
      year: json['year'] as int? ?? 0,
      contactEmail: json['contact_email'] as String? ?? '',
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
      moderationStatus: json['moderation_status'] as String? ?? '',
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
      absoluteCarName: json['absolute_car_name'] as String? ?? '',
      color: json['color'] as String? ?? '',
      locationUrl: json['location_url'] as String? ?? '',
      mileageImage: json['mileage_image'] as String? ?? '',
      purchaseDate: json['purchase_date'] as String? ?? '',
      registrationCertificate:
          json['registration_certificate'] as String? ?? '',
      registrationPlate: json['registration_plate'] as String? ?? '',
      registrationSerialNumber:
          json['registration_serial_number'] as String? ?? '',
      registrationVin: json['registration_vin'] as String? ?? '',
      stats: json['stats'] == null
          ? const StatsEntity()
          : const StatsConverter()
              .fromJson(json['stats'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$AutoModelToJson(AutoModel instance) => <String, dynamic>{
      'id': instance.id,
      'make': const CarMakeConverter().toJson(instance.make),
      'model': const CarModelConverter().toJson(instance.model),
      'generation': const CarGenerationConverter().toJson(instance.generation),
      'body_type': const TypeConverter().toJson(instance.bodyType),
      'drive_type': const TypeConverter().toJson(instance.driveType),
      'engine_type': const TypeConverter().toJson(instance.engineType),
      'gearbox_type': const TypeConverter().toJson(instance.gearboxType),
      'year': instance.year,
      'modification_type': const CarModificationTypeConverter()
          .toJson(instance.modificationType),
      'region': const CarDistrictConverter().toJson(instance.region),
      'district': const CarDistrictConverter().toJson(instance.district),
      'stats': const StatsConverter().toJson(instance.stats),
      'user': const CarUserConverter().toJson(instance.user),
      'dealer': instance.dealer,
      'licence_type': instance.licenceType,
      'moderation_status': instance.moderationStatus,
      'absolute_car_name': instance.absoluteCarName,
      'color': instance.color,
      'ownership': instance.ownership,
      'purchase_date': instance.purchaseDate,
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
      'views_count': instance.viewsCount,
      'is_wishlisted': instance.isWishlisted,
      'is_comparison': instance.isComparison,
      'discount': instance.discount,
      'contact_available_from': instance.contactAvailableFrom,
      'contact_available_to': instance.contactAvailableTo,
      'location_url': instance.locationUrl,
      'mileage_image': instance.mileageImage,
      'registration_vin': instance.registrationVin,
      'registration_plate': instance.registrationPlate,
      'registration_certificate': instance.registrationCertificate,
      'registration_serial_number': instance.registrationSerialNumber,
    };
