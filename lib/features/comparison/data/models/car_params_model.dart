import 'package:auto/features/comparison/domain/entities/car_params_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_params_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarParamsModel extends CarParamsEntity {
  const CarParamsModel(
      {required super.year,
      required super.state,
      required super.generation,
      required super.price,
      required super.model,
      required super.mark,
      required super.color,
      required super.numberOfOwners,
      required super.probeg,
      required super.razgon,
      required super.type,
      required super.volume});

  factory CarParamsModel.fromJson(Map<String, dynamic> json) =>
      _$CarParamsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarParamsModelToJson(this);
}
