// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_to_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementToPostModel _$AnnouncementToPostModelFromJson(
        Map<String, dynamic> json) =>
    AnnouncementToPostModel(
      bodyType: json['body_type'] as int? ?? -1,
      distanceTraveled: json['distance_traveled'] as int? ?? -1,
      driveType: json['drive_type'] as int? ?? -1,
      engineType: json['engine_type'] as int? ?? -1,
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      gearboxType: json['gearbox_type'] as int? ?? -1,
      generation: json['generation'] as int? ?? -1,
      id: json['id'] as int? ?? -1,
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? false,
      licenceType: json['licence_type'] as String? ?? '',
      make: json['make'] as int? ?? -1,
      model: json['model'] as int? ?? -1,
      modificationType: json['modification_type'] as int? ?? -1,
      ownership: json['ownership'] as String? ?? '',
      price: json['price'] as String? ?? '',
      purchaseDate: json['purchase_date'] as String? ?? '',
      region: json['region'] as int? ?? -1,
      registeredInUzbekistan:
          json['registered_in_uzbekistan'] as bool? ?? false,
      registrationCertificate:
          json['registration_certificate'] as String? ?? '',
      registrationPlate: json['registration_plate'] as String? ?? '',
      registrationSerialNumber:
          json['registration_serial_number'] as String? ?? '',
      registrationVin: json['registration_vin'] as String? ?? '',
      year: json['year'] as int? ?? -1,
      contactName: json['contact_name'] as String? ?? '',
      contactPhone: json['contact_phone'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      color: json['color'] as String?,
      contactAvailableFrom: json['contact_available_from'] as String?,
      contactAvailableTo: json['contact_available_to'] as String?,
      contactEmail: json['contact_email'] as String?,
      description: json['description'] as String?,
      district: json['district'] as int?,
      isNew: json['is_new'] as bool?,
      locationUrl: json['location_url'] as String?,
      damagedParts: (json['damaged_parts'] as List<dynamic>?)
              ?.map((e) => const DamagedPartEntityConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const <DamagedPartEntity>[],
    );

Map<String, dynamic> _$AnnouncementToPostModelToJson(
        AnnouncementToPostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'body_type': instance.bodyType,
      'drive_type': instance.driveType,
      'engine_type': instance.engineType,
      'gearbox_type': instance.gearboxType,
      'year': instance.year,
      'modification_type': instance.modificationType,
      'licence_type': instance.licenceType,
      'ownership': instance.ownership,
      'purchase_date': instance.purchaseDate,
      'is_registered_locally': instance.isRegisteredLocally,
      'contact_name': instance.contactName,
      'contact_phone': instance.contactPhone,
      'region': instance.region,
      'price': instance.price,
      'currency': instance.currency,
      'distance_traveled': instance.distanceTraveled,
      'registration_vin': instance.registrationVin,
      'registration_plate': instance.registrationPlate,
      'registration_certificate': instance.registrationCertificate,
      'registration_serial_number': instance.registrationSerialNumber,
      'registered_in_uzbekistan': instance.registeredInUzbekistan,
      'gallery': instance.gallery,
      'damaged_parts': instance.damagedParts
          .map(const DamagedPartEntityConverter().toJson)
          .toList(),
      'district': instance.district,
      'contact_email': instance.contactEmail,
      'location_url': instance.locationUrl,
      'contact_available_to': instance.contactAvailableTo,
      'description': instance.description,
      'contact_available_from': instance.contactAvailableFrom,
      'is_new': instance.isNew,
      'color': instance.color,
    };
