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
import 'package:auto/features/car_single/domain/entities/price_analytics_entity.dart';


part 'car_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarSingleModel extends CarSingleEntity {
  const CarSingleModel({
    super.description,
    super.contactAvailableFrom,
    super.absoluteCarName,
    super.id,
    super.model,
    super.currency,
    super.color,
    super.price,
    super.engineType,
    super.createdAt,
    super.updatedAt,
    super.bodyType,
    super.contactAvailableTo,
    super.contactEmail,
    super.contactName,
    super.contactPhone,
    super.damagedParts,
    super.distanceTraveled,
    super.driveType,
    super.gallery,
    super.gearboxType,
    super.generation,
    super.isMine,
    super.isNew,
    super.isRegisteredLocally,
    super.isWishlisted,
    super.latitude,
    super.licenceType,
    super.longitude,
    super.make,
    super.modificationType,
    super.ownership,
    super.publishedAt,
    super.purchaseDate,
    super.registeredInUzbekistan,
    super.registrationCertificate,
    super.registrationPlate,
    super.registrationSerialNumber,
    super.registrationVin,
    super.user,
    super.userType,
    super.viewsCount,
    super.callCount,
    super.wishlistCount,
    super.isComparison,
    super.year,
    super.isExpired,
    super.expiredAt,
    super.isRentWithPurchase,
    super.priceAnalytics,
  });

  factory CarSingleModel.fromJson(Map<String, dynamic> json) =>
      _$CarSingleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarSingleModelToJson(this);
}
