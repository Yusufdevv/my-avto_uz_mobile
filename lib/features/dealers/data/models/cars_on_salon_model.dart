import 'package:auto/features/dealers/domain/entities/cars_on_salon_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cars_on_salon_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarsOnSalonModel extends CarsOnSalonEntity {
  CarsOnSalonModel({
    required super.mark,
    required super.amount,
    required super.description,
    required super.mileage,
  });
  factory CarsOnSalonModel.fromJson(Map<String, dynamic> json) =>
      _$CarsOnSalonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarsOnSalonModelToJson(this);
}
