import 'package:auto/features/car_single/domain/entities/car_single_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_single_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarSingleModel extends CarSingleEntity {
  CarSingleModel(
      {required super.date,
      required super.carComplectation,
      required super.autoName,
      required super.views,
      required super.price});

  factory CarSingleModel.fromJson(Map<String, dynamic> json) =>
      _$CarSingleModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarSingleModelToJson(this);
}

class DistrictConverter
    implements JsonConverter<CarSingleEntity, Map<String, dynamic>?> {
  const DistrictConverter();

  @override
  CarSingleEntity fromJson(Map<String, dynamic>? json) =>
      CarSingleModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(CarSingleEntity object) => {};
}
