import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/id_name_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment_options_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EquipmentOptionsModel extends EquipmentOptionsEntity {
  const EquipmentOptionsModel({
    required super.id,
    required super.option,
    required super.item,
  });

  factory EquipmentOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentOptionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentOptionsModelToJson(this);
}
