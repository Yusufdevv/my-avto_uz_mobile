import 'package:auto/features/rent/domain/entities/rent_car_category_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_type_entity.dart';
import 'package:equatable/equatable.dart';

class RentCarEntity extends Equatable {
  final int id;
  @RentCarTypeConverter()
  final RentCarTypeEntity type;
  @RentCarCategoryConverter()
  final RentCarCategoryEntity category;
  final String make;
  final String model;
  final String generation;
  final String bodyType;
  final int year;
  final String driveType;
  final String equipmentType;
  final String gearboxType;
  final String engineType;
  final int engineVolume;
  final String color;
  final int distanceTraveled;
  final bool hasAirConditioner;
  final bool hasBabySeat;
  final bool isClean;
  final bool isFullFuel;
  final List<String> gallery;

  const RentCarEntity({
    this.id = 0,
    this.type = const RentCarTypeEntity(),
    this.category = const RentCarCategoryEntity(),
    this.make = '',
    this.model = '',
    this.generation = '',
    this.bodyType = '',
    this.year = 0,
    this.driveType = '',
    this.equipmentType = '',
    this.gearboxType = '',
    this.engineType = '',
    this.engineVolume = 0,
    this.color = '',
    this.distanceTraveled = 0,
    this.hasAirConditioner = false,
    this.hasBabySeat = false,
    this.isClean = false,
    this.isFullFuel = false,
    this.gallery = const [],
  });

  @override
  List<Object?> get props => [
        id,
        type,
        category,
        make,
        model,
        generation,
        bodyType,
        year,
        driveType,
        equipmentType,
        gearboxType,
        engineType,
        engineVolume,
        color,
        distanceTraveled,
        hasAirConditioner,
        hasBabySeat,
        isClean,
        isFullFuel,
        gallery,
      ];
}

// class RentCarConverter
//     implements JsonConverter<RentCarEntity, Map<String, dynamic>?> {
//   const RentCarConverter();

// @override
// RentCarEntity fromJson(Map<String, dynamic>? json) =>
//     RentCarModel.fromJson(json ?? {});

//   @override
//   Map<String, dynamic> toJson(RentCarEntity object) => {};
// }
