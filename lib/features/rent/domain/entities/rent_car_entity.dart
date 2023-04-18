import 'package:auto/features/ad/domain/entities/types/modification_type.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/rent/data/models/rent_car_model.dart';
import 'package:auto/features/rent/domain/entities/rent_car_bodytype_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_category_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_make_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_models_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_type_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentCarEntity extends Equatable {
  final int id;
  @RentCarTypeConverter()
  final RentCarTypeEntity type;
  @RentCarCategoryConverter()
  final RentCarCategoryEntity category;
  @RentCarMakeConverter()
  final RentCarMakeEntity make;
  @RentCarModelsConverter()
  final RentCarModelsEntity model;
  @CarGenerationConverter()
  final CarGenerationEntity generation;
  @RentCarBodyTypeConverter()
  final RentCarBodyTypeEntity bodyType;
  final int year;
  @RentCarBodyTypeConverter()
  final RentCarBodyTypeEntity driveType;
  @ModificationTypeEntityConverter()
  final ModificationTypeEntity modificationType;
  @RentCarBodyTypeConverter()
  final RentCarBodyTypeEntity gearboxType;
  @RentCarBodyTypeConverter()
  final RentCarBodyTypeEntity engineType;
  final double engineVolume;
  final String color;
  final int distanceTraveled;
  final bool hasAirConditioner;
  final bool hasBabySeat;
  final bool isClean;
  final bool isFullFuel;
  final List<String> gallery;
  final List<String> gallery360;

  const RentCarEntity({
    this.id = 0,
    this.type = const RentCarTypeEntity(),
    this.category = const RentCarCategoryEntity(),
    this.make = const RentCarMakeEntity(),
    this.model = const RentCarModelsEntity(),
    this.generation = const CarGenerationEntity(),
    this.bodyType = const RentCarBodyTypeEntity(),
    this.year = 0,
    this.driveType = const RentCarBodyTypeEntity(),
    this.modificationType = const ModificationTypeEntity(),
    this.gearboxType = const RentCarBodyTypeEntity(),
    this.engineType = const RentCarBodyTypeEntity(),
    this.engineVolume = 0.0,
    this.color = '',
    this.distanceTraveled = 0,
    this.hasAirConditioner = false,
    this.hasBabySeat = false,
    this.isClean = false,
    this.isFullFuel = false,
    this.gallery = const [],
    this.gallery360 = const [],
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
        modificationType,
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
        gallery360,
      ];
}

class RentCarConverter implements JsonConverter<RentCarEntity, Map<String, dynamic>?> {
  const RentCarConverter();

  @override
  RentCarEntity fromJson(Map<String, dynamic>? json) => RentCarModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentCarEntity object) => {};
}
