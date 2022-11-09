// import 'package:auto/features/car_single/domain/entities/car_generation_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_make_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_model_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_modification_type_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_type_entity.dart';
// import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
// import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
// import 'package:equatable/equatable.dart';

// class CarAnnoucementDetailEntity extends Equatable {
//   final int id;
//   @CarMakeConverter()
//   final CarMakeEntity make;
//   @CarModelConverter()
//   final CarModelEntity model;
//   final String absoluteCarName;
//   final String price;
//   final String currency;
//   final DateTime? publishedAt;
//   final int year;
//   final int distanceTraveled;
//   final String color;
//   @CarGenerationConverter()
//   final CarGenerationEntity generation;
//   @CarTypeConverter()
//   final CarTypeEntity bodyType;
//   @CarTypeConverter()
//   final CarTypeEntity driveType;
//   @CarTypeConverter()
//   final CarTypeEntity engineType;
//   @CarTypeConverter()
//   final CarTypeEntity gearboxType;
//   @CarModificationTypeConverter()
//   final CarModificationTypeEntity modificationType;
//   final String licenceType;
//   final String ownership;
//   final DateTime? purchaseDate;
//   final String description;
//   final bool isRegisteredLocally;
//   final String registrationVin;
//   final String registrationPlate;
//   final String registrationCertificate;
//   final String registrationSerialNumber;
//   final bool registeredInUzbekistan;
//   @CarUserConverter()
//   final CarUserEntity user;
//   final String contactName;
//   final String contactEmail;
//   final String contactPhone;
//   final String contactAvailableFrom;
//   final String contactAvailableTo;
//   final bool isNew;
//   final List<dynamic> gallery;
//   final double longitude;
//   final double latitude;
//   final bool isMine;
//   final int viewsCount;
//   final dynamic stats;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   @DamagedPartConverter()
//   final List<DamagedPartEntity> damagedParts;
//   final String userType;
//   final bool isWishlisted;

//   const CarAnnoucementDetailEntity({
//     this.id = 1,
//     this.make = const CarMakeEntity(),
//     this.model = const CarModelEntity(),
//     this.absoluteCarName = '',
//     this.price = '',
//     this.currency = '',
//     this.publishedAt,
//     this.year = 0,
//     this.distanceTraveled = 0,
//     this.color = '',
//     this.generation = const CarGenerationEntity(),
//     this.bodyType = const CarTypeEntity(),
//     this.driveType = const CarTypeEntity(),
//     this.engineType = const CarTypeEntity(),
//     this.gearboxType = const CarTypeEntity(),
//     this.modificationType = const CarModificationTypeEntity(),
//     this.licenceType = '',
//     this.ownership = '',
//     this.purchaseDate,
//     this.description = '',
//     this.isRegisteredLocally = false,
//     this.registrationVin = '',
//     this.registrationPlate = '',
//     this.registrationCertificate = '',
//     this.registrationSerialNumber = '',
//     this.registeredInUzbekistan = false,
//     this.user = const CarUserEntity(),
//     this.contactName = '',
//     this.contactEmail = '',
//     this.contactPhone = '',
//     this.contactAvailableFrom = '',
//     this.contactAvailableTo = '',
//     this.isNew = false,
//     this.gallery = const [],
//     this.longitude = 0,
//     this.latitude = 0,
//     this.isMine = false,
//     this.viewsCount = 0,
//     this.stats,
//     this.createdAt,
//     this.updatedAt,
//     this.damagedParts = const [DamagedPartEntity()],
//     this.userType = '',
//     this.isWishlisted = false,
//   });

//   @override
//   List<Object?> get props => [
//         id,
//         make,
//         model,
//         absoluteCarName,
//         price,
//         currency,
//         publishedAt,
//         year,
//         distanceTraveled,
//         color,
//         generation,
//         bodyType,
//         driveType,
//         engineType,
//         gearboxType,
//         modificationType,
//         licenceType,
//         ownership,
//         purchaseDate,
//         description,
//         isRegisteredLocally,
//         registrationVin,
//         registrationPlate,
//         registrationCertificate,
//         registrationSerialNumber,
//         registeredInUzbekistan,
//         user,
//         contactName,
//         contactEmail,
//         contactPhone,
//         contactAvailableFrom,
//         contactAvailableTo,
//         isNew,
//         gallery,
//         longitude,
//         latitude,
//         isMine,
//         viewsCount,
//         stats,
//         createdAt,
//         updatedAt,
//         damagedParts,
//         userType,
//         isWishlisted,
//       ];
// }
