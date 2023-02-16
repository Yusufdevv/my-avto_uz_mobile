import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/dealers/domain/entities/cars_in_marks_entity.dart';
import 'package:auto/features/dealers/domain/entities/dealer_single_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cars_in_marks_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarsInMarksModel extends CarsInMarksEntity {
  const CarsInMarksModel({
    required super.id,
    required super.make,
    required super.district,
    required super.description,
    required super.latitude,
    required super.longitude,
    required super.price,
    required super.locationUrl,
    required super.gallery,
    required super.color,
    required super.absoluteCarName,
    required super.bodyType,
    required super.contactAvailableFrom,
    required super.contactAvailableTo,
    required super.contactEmail,
    required super.contactName,
    required super.contactPhone,
    required super.contactViewsCount,
    required super.createdAt,
    required super.currency,
    required super.dealer,
    required super.descriptionRu,
    required super.descriptionUz,
    required super.discount,
    required super.distanceTraveled,
    required super.driveType,
    required super.engineType,
    required super.expiredAt,
    required super.gearboxType,
    required super.generation,
    required super.isNew,
    required super.isRegisteredLocally,
    required super.licenceType,
    required super.mileageImage,
    required super.model,
    required super.moderationStatus,
    required super.modificationType,
    required super.ownership,
    required super.publishedAt,
    required super.purchaseDate,
    required super.region,
    required super.registeredInUzbekistan,
    required super.registrationCertificate,
    required super.registrationPlate,
    required super.registrationSerialNumber,
    required super.registrationVin,
    required super.updatedAt,
    required super.user,
    required super.userType,
    required super.viewsCount,
    required super.year,
    required super.isWishlisted,
    required super.isComparison,
    required super.isRentWithPurchase,
  });

  factory CarsInMarksModel.fromJson(Map<String, dynamic> json) =>
      _$CarsInMarksModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarsInMarksModelToJson(this);
}
