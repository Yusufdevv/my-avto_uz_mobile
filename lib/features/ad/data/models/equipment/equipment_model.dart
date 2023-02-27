import 'package:auto/features/ad/domain/entities/equipment/equipment_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EquipmentModel extends EquipmentEntity {
  const EquipmentModel({
    required super.id,
    required super.name,
    required super.model,
    required super.options,
  });

  factory EquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentModelToJson(this);
}
