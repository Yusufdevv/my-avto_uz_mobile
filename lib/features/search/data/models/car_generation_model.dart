import 'package:auto/features/search/domain/entities/car_generation_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_generation_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarGenerationModel extends CarGenerationEntity {
  const CarGenerationModel(
      {required super.id,
      required super.logo,
      required super.model,
      required super.name,
      required super.yearBegin,
      required super.yearEnd});
  factory CarGenerationModel.fromJson(Map<String, dynamic> json) =>
      _$CarGenerationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarGenerationModelToJson(this);
}
