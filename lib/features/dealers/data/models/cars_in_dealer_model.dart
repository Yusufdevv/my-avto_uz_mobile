import 'package:auto/features/dealers/domain/entities/cars_in_dealer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';

part 'cars_in_dealer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarsInDealerModel extends CarsInDealerEntity {
  const CarsInDealerModel({
    required super.id,
  required super.make,
  required super.district,
  required super.description,
  required super.latitude,
  required super.longitude,
  required super.price,
  required super.locationUrl,
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
  required super.year
  });
  factory CarsInDealerModel.fromJson(Map<String, dynamic> json) =>
      _$CarsInDealerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarsInDealerModelToJson(this);
}
