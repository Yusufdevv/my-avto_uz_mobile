// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'announcement.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) =>
//     AnnouncementModel(
//       make: json['make'] as int? ?? 0,
//       model: json['model'] as int? ?? 0,
//       bodyType: json['body_type'] as int? ?? 0,
//       generation: json['generation'] as int? ?? 0,
//       driveType: json['drive_type'] as int? ?? 0,
//       engineType: json['engine_type'] as int? ?? 0,
//       gearboxType: json['gearbox_type'] as int? ?? 0,
//       year: json['year'] as int? ?? 0,
//       modificationType: json['modification_type'] as int? ?? 0,
//       color: json['color'] as String? ?? '',
//       licenceType: json['licence_type'] as String? ?? '',
//       ownership: json['ownership'] as String? ?? '',
//       purchaseDate: json['purchase_date'] as String? ?? '',
//       description: json['description'] as String? ?? '',
//       isRegisteredLocally: json['is_registered_locally'] as bool? ?? false,
//       contactName: json['contact_name'] as String? ?? '',
//       contactEmail: json['contact_email'] as String? ?? '',
//       contactPhone: json['contact_phone'] as String? ?? '',
//       contactAvailableFrom: json['contact_available_from'] as String? ?? '',
//       contactAvailableTo: json['contact_available_to'] as String? ?? '',
//       region: json['region'] as int? ?? 0,
//       district: json['district'] as int? ?? 0,
//       locationUrl: json['location_url'] as String? ?? '',
//       price: json['price'] as String? ?? '',
//       currency: json['currency'] as String? ?? '',
//       distanceTraveled: json['distance_traveled'] as int? ?? 0,
//       registrationVin: json['registration_vin'] as String? ?? '',
//       registrationPlate: json['registration_plate'] as String? ?? '',
//       registrationCertificate:
//           json['registration_certificate'] as String? ?? '',
//       registrationSerialNumber:
//           json['registration_serial_number'] as String? ?? '',
//       registeredInUzbekistan:
//           json['registered_in_uzbekistan'] as bool? ?? false,
//       isNew: json['is_new'] as bool? ?? false,
//       gallery: (json['gallery'] as List<dynamic>?)
//               ?.map((e) => e as String)
//               .toList() ??
//           [],
//       damagedParts: (json['damaged_parts'] as List<dynamic>?)
//               ?.map(
//                   (e) => DamagedPartsModel.fromJson(e as Map<String, dynamic>))
//               .toList() ??
//           [],
//     );

// Map<String, dynamic> _$AnnouncementModelToJson(AnnouncementModel instance) =>
//     <String, dynamic>{
//       'make': instance.make,
//       'model': instance.model,
//       'body_type': instance.bodyType,
//       'generation': instance.generation,
//       'drive_type': instance.driveType,
//       'engine_type': instance.engineType,
//       'gearbox_type': instance.gearboxType,
//       'year': instance.year,
//       'modification_type': instance.modificationType,
//       'color': instance.color,
//       'licence_type': instance.licenceType,
//       'ownership': instance.ownership,
//       'purchase_date': instance.purchaseDate,
//       'description': instance.description,
//       'is_registered_locally': instance.isRegisteredLocally,
//       'contact_name': instance.contactName,
//       'contact_email': instance.contactEmail,
//       'contact_phone': instance.contactPhone,
//       'contact_available_from': instance.contactAvailableFrom,
//       'contact_available_to': instance.contactAvailableTo,
//       'region': instance.region,
//       'district': instance.district,
//       'location_url': instance.locationUrl,
//       'price': instance.price,
//       'currency': instance.currency,
//       'distance_traveled': instance.distanceTraveled,
//       'registration_vin': instance.registrationVin,
//       'registration_plate': instance.registrationPlate,
//       'registration_certificate': instance.registrationCertificate,
//       'registration_serial_number': instance.registrationSerialNumber,
//       'registered_in_uzbekistan': instance.registeredInUzbekistan,
//       'is_new': instance.isNew,
//       'gallery': instance.gallery,
//       'damaged_parts': instance.damagedParts,
//     };
