// import 'package:auto/features/car_single/domain/entities/car_annoucement_detail_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_generation_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_make_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_model_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_modification_type_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_type_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
// import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'car_announcement_detail_model.g.dart';

// @JsonSerializable(fieldRename: FieldRename.snake)
// class CarAnnouncementDetailModel extends CarAnnoucementDetailEntity {
//   const CarAnnouncementDetailModel(
//       {required super.id,
//       super.make,
//       super.model,
//       super.absoluteCarName,
//       super.price,
//       super.currency,
//       super.publishedAt,
//       super.year,
//       super.distanceTraveled,
//       super.color,
//       super.generation,
//       super.bodyType,
//       super.driveType,
//       super.engineType,
//       super.gearboxType,
//       super.modificationType,
//       super.licenceType,
//       super.ownership,
//       super.purchaseDate,
//       super.description,
//       super.isRegisteredLocally,
//       super.registrationVin,
//       super.registrationPlate,
//       super.registrationCertificate,
//       super.registrationSerialNumber,
//       super.registeredInUzbekistan,
//       super.user,
//       super.contactName,
//       super.contactEmail,
//       super.contactPhone,
//       super.contactAvailableFrom,
//       super.contactAvailableTo,
//       super.isNew,
//       super.gallery,
//       super.longitude,
//       super.latitude,
//       super.isMine,
//       super.viewsCount,
//       super.stats,
//       super.createdAt,
//       super.updatedAt,
//       super.damagedParts,
//       super.userType,
//       super.isWishlisted});

//   factory CarAnnouncementDetailModel.fromJson(Map<String, dynamic>? json) =>
//       _$CarAnnouncementDetailModelFromJson(json ?? {});
//   Map<String, dynamic> toJson() => _$CarAnnouncementDetailModelToJson(this);
// }
