import 'package:auto/features/common/domain/entity/car_modification_type_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_modification_type_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarModificationTypeModel extends CarModificationTypeEntity {
  const CarModificationTypeModel({
    required super.id,
    required super.power,
    required super.volume,
  });
  factory CarModificationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$CarModificationTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarModificationTypeModelToJson(this);
}
