import 'package:auto/features/search/domain/entities/car_model_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_model_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarModelModel extends CarModelEntity {
  const CarModelModel(
      {required super.id, required super.name, required super.make});
  factory CarModelModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModelModelToJson(this);
}
