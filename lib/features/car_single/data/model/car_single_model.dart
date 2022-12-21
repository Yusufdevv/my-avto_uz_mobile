import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
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

part 'car_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarSingleModel extends CarSingleEntity {
  CarSingleModel({
    required super.id,
    required super.make,
    required super.model,
    required super.autoName,
    required super.price,
    required super.currency,
    required super.date,
    required super.year,
    required super.distanceTraveled,
    required super.color,
    required super.generation,
    required super.bodyType,
    required super.driveType,
    required super.engineType,
    required super.gearboxType,
    required super.modificationType,
    required super.licenceType,
    required super.ownership,
    required super.purchaseDate,
    required super.description,
    required super.isRegisteredLocally,
    required super.registrationVin,
    required super.registrationPlate,
    required super.registrationCertificate,
    required super.registrationSerialNumber,
    required super.registeredInUzbekistan,
    required super.user,
    required super.contactName,
    required super.contactEmail,
    required super.contactPhone,
    required super.isNew,
    required super.gallery,
    required super.longitude,
    required super.latitude,
    required super.isMine,
    required super.viewsCount,
    required super.createdAt,
    required super.updatedAt,
    required super.damagedParts,
  });

  factory CarSingleModel.fromJson(Map<String, dynamic> json) =>
      _$CarSingleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarSingleModelToJson(this);
}
