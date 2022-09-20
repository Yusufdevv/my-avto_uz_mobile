import 'package:auto/features/rent/domain/entities/rent_car_category_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarModel extends RentCarEntity {
  const RentCarModel({
    required super.id,
    required super.gallery,
    required super.isFullFuel,
    required super.hasBabySeat,
    required super.hasAirConditioner,
    required super.distanceTraveled,
    required super.color,
    required super.engineVolume,
    required super.engineType,
    required super.gearboxType,
    required super.equipmentType,
    required super.driveType,
    required super.year,
    required super.bodyType,
    required super.generation,
    required super.model,
    required super.make,
    required super.category,
    required super.type,
    required super.isClean,
  });
  //
  factory RentCarModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarModelToJson(this);
}
