// import 'package:auto/features/ad/data/models/announcement.dart';
// import 'package:auto/features/car_single/data/model/damaged_parts_model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// class AnnouncementEntity extends Equatable {
//   @JsonKey(name: 'make', defaultValue: 0)
//   final int make;
//   @JsonKey(name: 'model', defaultValue: 0)
//   final int model;
//   @JsonKey(name: 'body_type', defaultValue: 0)
//   final int bodyType;
//   @JsonKey(name: 'generation', defaultValue: 0)
//   final int generation;
//   @JsonKey(name: 'drive_type', defaultValue: 0)
//   final int driveType;
//   @JsonKey(name: 'engine_type', defaultValue: 0)
//   final int engineType;
//   @JsonKey(name: 'gearbox_type', defaultValue: 0)
//   final int gearboxType;
//   @JsonKey(name: 'year', defaultValue: 0)
//   final int year;
//   @JsonKey(name: 'modification_type', defaultValue: 0)
//   final int modificationType;
//   @JsonKey(name: 'color', defaultValue: '')
//   final String color;
//   @JsonKey(name: 'licence_type', defaultValue: '')
//   final String licenceType;
//   @JsonKey(name: 'ownership', defaultValue: '')
//   final String ownership;
//   @JsonKey(name: 'purchase_date', defaultValue: '')
//   final String purchaseDate;
//   @JsonKey(name: 'description', defaultValue: '')
//   final String description;
//   @JsonKey(name: 'is_registered_locally', defaultValue: false)
//   final bool isRegisteredLocally;
//   @JsonKey(name: 'contact_name', defaultValue: '')
//   final String contactName;
//   @JsonKey(name: 'contact_email', defaultValue: '')
//   final String contactEmail;
//   @JsonKey(name: 'contact_phone', defaultValue: '')
//   final String contactPhone;
//   @JsonKey(name: 'contact_available_from', defaultValue: '')
//   final String contactAvailableFrom;
//   @JsonKey(name: 'contact_available_to', defaultValue: '')
//   final String contactAvailableTo;
//   @JsonKey(name: 'region', defaultValue: 0)
//   final int region;
//   @JsonKey(name: 'district', defaultValue: 0)
//   final int district;
//   @JsonKey(name: 'location_url', defaultValue: '')
//   final String locationUrl;
//   @JsonKey(name: 'price', defaultValue: '')
//   final String price;
//   @JsonKey(name: 'currency', defaultValue: '')
//   final String currency;
//   @JsonKey(name: 'distance_traveled', defaultValue: 0)
//   final int distanceTraveled;
//   @JsonKey(name: 'registration_vin', defaultValue: '')
//   final String registrationVin;
//   @JsonKey(name: 'registration_plate', defaultValue: '')
//   final String registrationPlate;
//   @JsonKey(name: 'registration_certificate', defaultValue: '')
//   final String registrationCertificate;
//   @JsonKey(name: 'registration_serial_number', defaultValue: '')
//   final String registrationSerialNumber;
//   @JsonKey(name: 'registered_in_uzbekistan', defaultValue: false)
//   final bool registeredInUzbekistan;
//   @JsonKey(name: 'is_new', defaultValue: false)
//   final bool isNew;
//   @JsonKey(name: 'gallery', defaultValue: [])
//   final List<String> gallery;
//   @JsonKey(name: 'damaged_parts', defaultValue: [])
//   final List<DamagedPartsModel> damagedParts;

//   const AnnouncementEntity({
//     required this.make,
//     required this.model,
//     required this.bodyType,
//     required this.generation,
//     required this.driveType,
//     required this.engineType,
//     required this.gearboxType,
//     required this.year,
//     required this.modificationType,
//     required this.color,
//     required this.licenceType,
//     required this.ownership,
//     required this.purchaseDate,
//     required this.description,
//     required this.isRegisteredLocally,
//     required this.contactName,
//     required this.contactEmail,
//     required this.contactPhone,
//     required this.contactAvailableFrom,
//     required this.contactAvailableTo,
//     required this.region,
//     required this.district,
//     required this.locationUrl,
//     required this.price,
//     required this.currency,
//     required this.distanceTraveled,
//     required this.registrationVin,
//     required this.registrationPlate,
//     required this.registrationCertificate,
//     required this.registrationSerialNumber,
//     required this.registeredInUzbekistan,
//     required this.isNew,
//     required this.gallery,
//     required this.damagedParts,
//   });

//   @override
//   List<Object?> get props => [
//         make,
//         model,
//         bodyType,
//         generation,
//         driveType,
//         engineType,
//         gearboxType,
//         year,
//         modificationType,
//         color,
//         licenceType,
//         ownership,
//         purchaseDate,
//         description,
//         isRegisteredLocally,
//         contactName,
//         contactEmail,
//         contactPhone,
//         contactAvailableFrom,
//         contactAvailableTo,
//         region,
//         district,
//         locationUrl,
//         price,
//         currency,
//         distanceTraveled,
//         registrationVin,
//         registrationPlate,
//         registrationCertificate,
//         registrationSerialNumber,
//         registeredInUzbekistan,
//         isNew,
//         gallery,
//         damagedParts,
//       ];
// }

// class AnnouncementEntityConverter
//     extends JsonConverter<AnnouncementEntity, Map<String, dynamic>?> {
//   const AnnouncementEntityConverter();

//   @override
//   AnnouncementEntity fromJson(Map<String, dynamic>? json) =>
//       AnnouncementModel.fromJson(json ?? {});

//   @override
//   Map<String, dynamic> toJson(AnnouncementEntity object) => {};
// }
