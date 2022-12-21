import 'package:auto/features/common/domain/entity/auto_entity.dart';
import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:auto/features/common/domain/entity/car_generation_entity.dart';
import 'package:auto/features/common/domain/entity/car_make_entity.dart';
import 'package:auto/features/common/domain/entity/car_model_entity.dart';
import 'package:auto/features/common/domain/entity/car_modification_type_entity.dart';
import 'package:auto/features/common/domain/entity/car_user_entity.dart';
import 'package:auto/features/common/domain/entity/type_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auto_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AutoModel extends AutoEntity {
  const AutoModel({
    required super.id,
    required super.carBodyType,
    required super.carDriveType,
    required super.carEngineType,
    required super.carGearboxType,
    required super.carGeneration,
    required super.carMake,
    required super.carModel,
    required super.carModificationType,
    required super.carYear,
    required super.contactEmail,
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
    required super.longitude,
    required super.ownership,
    required super.price,
    required super.publishedAt,
    required super.region,
    required super.registeredInUzbekistan,
    required super.carUser,
    required super.userType,
    required super.viewsCount,
  });

  factory AutoModel.fromJson(Map<String, dynamic> json) =>
      _$AutoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AutoModelToJson(this);
}
