import 'package:auto/features/ad/domain/entities/equipment/equipment_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment_category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EquipmentCategoryModel extends EquipmentCategoryEntity {
  const EquipmentCategoryModel({
    required super.id,
    required super.name,
  });

  factory EquipmentCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentCategoryModelToJson(this);
}
