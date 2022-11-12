
import 'package:auto/features/search/domain/entities/car_make_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_make_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarMakeModel extends CarMakeEntity {
  const CarMakeModel(
      {required super.id, required super.logo, super.slug, super.name});
  factory CarMakeModel.fromJson(Map<String, dynamic> json) =>
      _$CarMakeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarMakeModelToJson(this);
}
