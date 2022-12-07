// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSingleModel _$CarSingleModelFromJson(Map<String, dynamic> json) =>
    CarSingleModel(
      id: json['id'] as int? ?? 0,
      make: json['make'] == null
          ? const RentCarMakeEntity()
          : const RentCarMakeConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
      model: json['model'] == null
          ? const RentCarModelsEntity()
          : const RentCarModelsConverter()
              .fromJson(json['model'] as Map<String, dynamic>?),
      autoName: json['auto_name'] as String? ?? '',
      price: json['price'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      date: json['date'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      distanceTraveled: json['distance_traveled'] as int? ?? 0,
      color: json['color'] as String? ?? '',
      generation: json['generation'] == null
          ? const RentCarGenerationEntity()
          : const RentCarGenerationConverter()
              .fromJson(json['generation'] as Map<String, dynamic>?),
      bodyType: json['body_type'] == null
          ? const RentCarBodyTypeEntity()
          : const RentCarBodyTypeConverter()
              .fromJson(json['body_type'] as Map<String, dynamic>?),
      driveType: json['drive_type'] == null
          ? const RentCarDriveTypeEntity()
          : const RentCarDriveTypeConverter()
              .fromJson(json['drive_type'] as Map<String, dynamic>?),
      engineType: json['engine_type'] == null
          ? const RentCarEngineTypeEntity()
          : const RentCarEngineTypeConverter()
              .fromJson(json['engine_type'] as Map<String, dynamic>?),
      gearboxType: json['gearbox_type'] == null
          ? const RentCarGearboxTypeEntity()
          : const RentCarGearboxTypeConverter()
              .fromJson(json['gearbox_type'] as Map<String, dynamic>?),
      modificationType: json['modification_type'] == null
          ? const RentCarModificationEntity()
          : const RentCarModificationConverter()
              .fromJson(json['modification_type'] as Map<String, dynamic>?),
      licenceType: json['licence_type'] as String? ?? '',
      ownership: json['ownership'] as String? ?? '',
      purchaseDate: json['purchase_date'] as String? ?? '',
      description: json['description'] as String? ?? '',
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? false,
      registrationVin: json['registration_vin'] as String? ?? '',
      registrationPlate: json['registration_plate'] as String? ?? '',
      registrationCertificate:
          json['registration_certificate'] as String? ?? '',
      registrationSerialNumber:
          json['registration_serial_number'] as String? ?? '',
      registeredInUzbekistan:
          json['registered_in_uzbekistan'] as bool? ?? false,
      user: json['user'] == null
          ? const CarUserEntity()
          : const CarUserConverter()
              .fromJson(json['user'] as Map<String, dynamic>?),
      contactName: json['contact_name'] as String? ?? '',
      contactEmail: json['contact_email'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      isNew: json['is_new'] as bool? ?? false,
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      longitude: json['longitude'] as int? ?? 0,
      latitude: json['latitude'] as int? ?? 0,
      isMine: json['is_mine'] as bool? ?? false,
      viewsCount: json['views_count'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      damagedParts: (json['damaged_parts'] as List<dynamic>?)
              ?.map((e) => const DamagedPartsConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CarSingleModelToJson(CarSingleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': const RentCarMakeConverter().toJson(instance.make),
      'model': const RentCarModelsConverter().toJson(instance.model),
      'auto_name': instance.autoName,
      'price': instance.price,
      'currency': instance.currency,
      'date': instance.date,
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
          const RentCarGearboxTypeConverter().toJson(instance.gearboxType),
      'modification_type': const RentCarModificationConverter()
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
      'is_new': instance.isNew,
      'gallery': instance.gallery,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'is_mine': instance.isMine,
      'views_count': instance.viewsCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'damaged_parts': instance.damagedParts
          .map(const DamagedPartsConverter().toJson)
          .toList(),
    };
