import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarSingleModel extends CarSingleEntity {
  CarSingleModel(
      {
    required super.id,
  required super.color,
  required super.price,
  required super.views,
  required super.autoName,
  required super.date,
  required super.body,
  required super.complectation,
  required super.accident,
  required super.bodytype,
  required super.clearance,
  required super.driverAirbag,
  required super.driveUnit,
  required super.enginePower,
  required super.engineSize,
  required super.engineSizeM,
  required super.engineType,
  required super.fuelConsuption,
  required super.hsa,
  required super.issueYear,
  required super.leftDoor,
  required super.leftFrontDoor,
  required super.legsAirbag,
  required super.milleage,
  required super.milleageHistory,
  required super.passengerAirabag,
  required super.ptsOwner,
  required super.rastomojka,
  required super.rightDoor,
  required super.rightFrontDoor,
  required super.sellerComent,
  required super.sellerName,
  required super.similarPrice,
  required super.speed,
  required super.transmission,
  required super.transmissionCount,
  required super.transmissionType,
  required super.wanted,
  required super.weight,
  required super.windowAirbag,
  required super.zalog,
      });

  factory CarSingleModel.fromJson(Map<String, dynamic> json) =>
      _$CarSingleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarSingleModelToJson(this);
}

class DistrictConverter
    implements JsonConverter<CarSingleEntity, Map<String, dynamic>?> {
  const DistrictConverter();

  @override
  CarSingleEntity fromJson(Map<String, dynamic>? json) =>
      CarSingleModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarSingleEntity object) => {};
}
