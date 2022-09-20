import 'package:auto/features/rent/domain/entities/rent_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentModel extends RentEntity {
  const RentModel({
    required super.id,
    required super.minDrivingExperience,
    required super.minAge,
    required super.price,
    required super.region,
    required super.rentCar,
  });

  factory RentModel.fromJson(Map<String, dynamic> json) =>
      _$RentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentModelToJson(this);
}
