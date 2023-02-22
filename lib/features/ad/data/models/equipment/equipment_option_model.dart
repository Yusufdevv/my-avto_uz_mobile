import 'package:auto/features/ad/domain/entities/equipment/equipment_category_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment_option_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EquipmentOptionModel extends EquipmentOptionEntity {
  const EquipmentOptionModel({
    required super.id,
    required super.name,
    required super.category,
    required super.type,
  });

  factory EquipmentOptionModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentOptionModelToJson(this);
}
