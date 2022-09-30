import 'package:auto/features/rent/domain/entities/rent_main_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';

part 'rent_main_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentMainModel extends RentMainEntity {
  const RentMainModel({
    required super.id,
    required super.name,
    required super.rentCars,
  });

  factory RentMainModel.fromJson(Map<String, dynamic> json) =>
      _$RentMainModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentMainModelToJson(this);
}
