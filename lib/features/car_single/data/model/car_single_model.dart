import 'package:auto/features/ad/domain/entities/district_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/id_name_entity.dart';
import 'package:auto/features/ad/domain/entities/rent_with_purchase/rent_with_purchase_entity.dart';
import 'package:auto/features/ad/domain/entities/types/gearbox_type.dart';
import 'package:auto/features/ad/domain/entities/types/modification_type.dart';
import 'package:auto/features/car_single/domain/entities/announcement_verify_owner_entity.dart';
import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:auto/features/car_single/domain/entities/car_user_entity.dart';
import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:auto/features/car_single/domain/entities/drive_type_entity.dart';
import 'package:auto/features/car_single/domain/entities/engine_type_entity.dart';
import 'package:auto/features/car_single/domain/entities/price_analytics_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/entities/color_entity.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_bodytype_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_make_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_models_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarSingleModel extends CarSingleEntity {
  const CarSingleModel(
      {super.gasEquipment,
      super.options,
      super.equipment,
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
      super.todayViewedCount,
      super.callCount,
      super.wishlistCount,
      super.isComparison,
      super.year,
      super.isExpired,
      super.expiredAt,
      super.isRentWithPurchase,
      super.priceAnalytics,
      super.rentWithPurchase,
      super.region,
      super.district,
      super.announcementVerifyOwners
      });

  factory CarSingleModel.fromJson(Map<String, dynamic> json) =>
      _$CarSingleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarSingleModelToJson(this);
}
