import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_modification_type_entity.dart';
import 'package:auto/features/common/domain/entity/car_user_entity.dart';
import 'package:auto/features/common/domain/entity/stats_entity.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auto_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AutoModel extends AutoEntity {
    AutoModel({
    required super.id,
    required super.bodyType,
    required super.driveType,
    required super.engineType,
    required super.gearboxType,
    required super.generation,
    required super.make,
    required super.model,
    required super.modificationType,
    required super.year,
    required super.contactEmail,
    required super.expiredAt,
    required super.isExpired,
    required super.contactName,
    required super.contactPhone,
    required super.currency,
    required super.dealer,
    required super.description,
    required super.distanceTraveled,
    required super.district,
    required super.gallery,
    required super.isNew,
    required super.isRegisteredLocally,
    required super.isWishlisted,
    required super.latitude,
    required super.licenceType,
    required super.moderationStatus,
    required super.longitude,
    required super.ownership,
    required super.price,
    required super.publishedAt,
    required super.region,
    required super.registeredInUzbekistan,
    required super.user,
    required super.userType,
    required super.viewsCount,
    required super.isComparison,
    required super.discount,
    required super.contactAvailableFrom,
    required super.contactAvailableTo,
    required super.absoluteCarName,
    required super.color,
    required super.locationUrl,
    required super.mileageImage,
    required super.purchaseDate,
    required super.registrationCertificate,
    required super.registrationPlate,
    required super.registrationSerialNumber,
    required super.registrationVin,
    required super.stats,
  });

  factory AutoModel.fromJson(Map<String, dynamic> json) =>
      _$AutoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AutoModelToJson(this);
}
