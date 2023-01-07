import 'package:auto/features/common/domain/entity/car_dealer_entity.dart';
import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_dealer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarDealerModel extends CarDealerEntity {
  const CarDealerModel(
      {required super.id,
      required super.name,
      required super.slug,
      required super.description,
      required super.phoneNumber,
      required super.contactFrom,
      required super.contactTo,
      required super.longitude,
      required super.latitude,
      required super.district,
      required super.avatar,
      required super.carCount});
  factory CarDealerModel.fromJson(Map<String, dynamic> json) =>
      _$CarDealerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarDealerModelToJson(this);
}
