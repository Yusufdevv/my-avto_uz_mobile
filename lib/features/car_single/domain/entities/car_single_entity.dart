import 'package:auto/features/car_single/data/model/car_single_model.dart';
import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/domain/entities/drive_type_entity.dart';
import 'package:auto/features/car_single/domain/entities/engine_type_entity.dart';
import 'package:auto/features/car_single/domain/entities/gearbox_type_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_bodytype_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_generation_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_make_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_models_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_modification_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarSingleEntity extends Equatable {
  @JsonKey(defaultValue: 0)
  final int id;
  @RentCarMakeConverter()
  final RentCarMakeEntity make;
  @RentCarModelsConverter()
  final RentCarModelsEntity model;
  @JsonKey(defaultValue: '')
  final String absoluteCarName;
  @JsonKey(defaultValue: '')
  final String price;
  @JsonKey(defaultValue: '')
  final String currency;
  @JsonKey(defaultValue: '')
  final String publishedAt;
  @JsonKey(defaultValue: 0)
  final int year;
  @JsonKey(defaultValue: 0)
  final int distanceTraveled;
  @JsonKey(defaultValue: '')
  final String color;
  @RentCarGenerationConverter()
  final RentCarGenerationEntity generation;
  @RentCarBodyTypeConverter()
  final RentCarBodyTypeEntity bodyType;
  @RentCarDriveTypeConverter()
  final RentCarDriveTypeEntity driveType;
  @RentCarEngineTypeConverter()
  final RentCarEngineTypeEntity engineType;
  @RentCarGearboxTypeConverter()
  final RentCarGearboxTypeEntity gearboxType;
  @RentCarModificationConverter()
  final RentCarModificationEntity modificationType;
  @JsonKey(defaultValue: '')
  final String licenceType;
  @JsonKey(defaultValue: '')
  final String ownership;
  @JsonKey(defaultValue: '')
  final String purchaseDate;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: false)
  final bool isRegisteredLocally;
  @JsonKey(defaultValue: '')
  final String registrationVin;
  @JsonKey(defaultValue: '')
  final String registrationPlate;
  @JsonKey(defaultValue: '')
  final String registrationCertificate;
  @JsonKey(defaultValue: '')
  final String registrationSerialNumber;
  @JsonKey(defaultValue: false)
  final bool registeredInUzbekistan;
  @CarUserConverter()
  final CarUserEntity user;
  @JsonKey(defaultValue: '')
  final String contactName;
  @JsonKey(defaultValue: '')
  final String contactEmail;
  @JsonKey(defaultValue: '')
  final String contactPhone;
  @JsonKey(defaultValue: '')
  final String contactAvailableFrom;
  @JsonKey(defaultValue: '')
  final String contactAvailableTo;
  @JsonKey(defaultValue: false)
  final bool isNew;
  @JsonKey(defaultValue: [])
  final List<String> gallery;
  @JsonKey(defaultValue: 0)
  final double longitude;
  @JsonKey(defaultValue: 0)
  final double latitude;
  @JsonKey(defaultValue: false)
  final bool isMine;
  @JsonKey(defaultValue: 0)
  final int viewsCount;
  @JsonKey(defaultValue: '')
  final String createdAt;
  @JsonKey(defaultValue: '')
  final String updatedAt;
  @DamagedPartsConverter()
  final List<DamagedPartsEntity> damagedParts;
  @JsonKey(defaultValue: '')
  final String userType;
  @JsonKey(defaultValue: false)
  final bool isWishlisted;
  @JsonKey(defaultValue: 0)
  final int wishlistCount;
  @JsonKey(defaultValue: 0)
  final int callCount;
  @JsonKey(defaultValue: false)
  final bool isComparison;

  const CarSingleEntity({
    this.isComparison = false,
    this.wishlistCount = 0,
    this.callCount = 0,
    this.absoluteCarName = '',
    this.publishedAt = '',
    this.contactAvailableFrom = '',
    this.contactAvailableTo = '',
    this.userType = '',
    this.isWishlisted = false,
    this.id = 0,
    this.make = const RentCarMakeEntity(),
    this.model = const RentCarModelsEntity(),
    this.price = '',
    this.currency = '',
    this.year = 0,
    this.distanceTraveled = 0,
    this.color = '',
    this.generation = const RentCarGenerationEntity(),
    this.bodyType = const RentCarBodyTypeEntity(),
    this.driveType = const RentCarDriveTypeEntity(),
    this.engineType = const RentCarEngineTypeEntity(),
    this.gearboxType = const RentCarGearboxTypeEntity(),
    this.modificationType = const RentCarModificationEntity(),
    this.licenceType = '',
    this.ownership = '',
    this.purchaseDate = '',
    this.description = '',
    this.isRegisteredLocally = false,
    this.registrationVin = '',
    this.registrationPlate = '',
    this.registrationCertificate = '',
    this.registrationSerialNumber = '',
    this.registeredInUzbekistan = false,
    this.user = const CarUserEntity(),
    this.contactName = '',
    this.contactEmail = '',
    this.contactPhone = '',
    this.isNew = false,
    this.gallery = const [],
    this.longitude = 0,
    this.latitude = 0,
    this.isMine = false,
    this.viewsCount = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.damagedParts = const [],
  });

  @override
  List<Object?> get props => [
        absoluteCarName,
        publishedAt,
        contactAvailableFrom,
        contactAvailableTo,
        userType,
        isWishlisted,
        id,
        make,
        model,
        price,
        currency,
        year,
        distanceTraveled,
        color,
        generation,
        bodyType,
        driveType,
        engineType,
        gearboxType,
        modificationType,
        licenceType,
        ownership,
        purchaseDate,
        description,
        isRegisteredLocally,
        registrationVin,
        registrationPlate,
        registrationCertificate,
        registrationSerialNumber,
        registeredInUzbekistan,
        user,
        contactName,
        contactEmail,
        contactPhone,
        isNew,
        gallery,
        longitude,
        latitude,
        isMine,
        callCount,
        isWishlisted,
        isComparison,
      ];
}

class CarSingleConverter<S>
    implements JsonConverter<CarSingleEntity, Map<String, dynamic>?> {
  const CarSingleConverter();

  @override
  CarSingleEntity fromJson(Map<String, dynamic>? json) =>
      CarSingleModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarSingleEntity object) => {};
}
