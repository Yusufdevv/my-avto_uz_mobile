import 'package:auto/features/rent/domain/entities/rent_car_generation_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rent_car_generation_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RentCarGenerationModel extends RentCarGenerationEntity {
  const RentCarGenerationModel({
    required super.id,
    required super.name,
    required super.yearBegin,
    required super.yearEnd,
    required super.model,
    required super.logo,
  });

  factory RentCarGenerationModel.fromJson(Map<String, dynamic> json) =>
      _$RentCarGenerationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentCarGenerationModelToJson(this);
}
