import 'package:auto/features/car_single/domain/entities/damaged_parts_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'damaged_parts_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DamagedPartsModel extends DamagedPartsEntity {
  const DamagedPartsModel({
    required super.damageType,
    required super.part,
  });
  factory DamagedPartsModel.fromJson(Map<String, dynamic> json) =>
      _$DamagedPartsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DamagedPartsModelToJson(this);
}
