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
import 'package:json_annotation/json_annotation.dart';

class CarSingleEntity {
  final int id;
  @RentCarMakeConverter()
  final RentCarMakeEntity make;
  @RentCarModelsConverter()
  final RentCarModelsEntity model;
  final String autoName;
  final String price;
  final String currency;
  final String date;
  final int year;
  final int distanceTraveled;
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
  final String licenceType;
  final String ownership;
  final String purchaseDate;
  final String description;
  final bool isRegisteredLocally;
  final String registrationVin;
  final String registrationPlate;
  final String registrationCertificate;
  final String registrationSerialNumber;
  final bool registeredInUzbekistan;
  @CarUserConverter()
  final CarUserEntity user;
  final String contactName;
  final String contactEmail;
  final String contactPhone;
  final bool isNew;
  final List<String> gallery;
  final int longitude;
  final int latitude;
  final bool isMine;
  final int viewsCount;
  final String createdAt;
  final String updatedAt;
  @DamagedPartsConverter()
  final List<DamagedPartsEntity> damagedParts;

  const CarSingleEntity({
    this.id = 0,
    this.make = const RentCarMakeEntity(),
    this.model = const RentCarModelsEntity(),
    this.autoName = '',
    this.price = '',
    this.currency = '',
    this.date = '',
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
        id,
        make,
        model,
        autoName,
        price,
        currency,
        date,
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
        viewsCount,
        createdAt,
        updatedAt,
        damagedParts,
      ];
}

class CarSingleConverter<S> implements JsonConverter<CarSingleEntity, Map<String, dynamic>?> {
  const CarSingleConverter();

  @override
  CarSingleEntity fromJson(Map<String, dynamic>? json) => CarSingleModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarSingleEntity object) => {};
}
