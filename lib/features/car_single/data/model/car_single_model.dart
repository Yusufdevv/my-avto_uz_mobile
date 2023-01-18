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
  CarSingleModel(
      {required super.description,
      required super.contactAvailableFrom,
      required super.absoluteCarName,
      required super.id,
      required super.model,
      required super.currency,
      required super.color,
      required super.price,
      required super.engineType,
      required super.createdAt,
      required super.updatedAt,
      required super.bodyType,
      required super.contactAvailableTo,
      required super.contactEmail,
      required super.contactName,
      required super.contactPhone,
      required super.damagedParts,
      required super.distanceTraveled,
      required super.driveType,
      required super.gallery,
      required super.gearboxType,
      required super.generation,
      required super.isMine,
      required super.isNew,
      required super.isRegisteredLocally,
      required super.isWishlisted,
      required super.latitude,
      required super.licenceType,
      required super.longitude,
      required super.make,
      required super.modificationType,
      required super.ownership,
      required super.publishedAt,
      required super.purchaseDate,
      required super.registeredInUzbekistan,
      required super.registrationCertificate,
      required super.registrationPlate,
      required super.registrationSerialNumber,
      required super.registrationVin,
      required super.user,
      required super.userType,
      required super.viewsCount,
      required super.callCount,
      required super.wishlistCount,
      required super.isComparison,
      required super.year});

  factory CarSingleModel.fromJson(Map<String, dynamic> json) =>
      _$CarSingleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarSingleModelToJson(this);
}
