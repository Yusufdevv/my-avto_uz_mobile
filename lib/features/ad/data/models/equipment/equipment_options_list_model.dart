import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment_options_list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class EquipmentOptionsListModel extends EquipmentOptionsListEntity {
  const EquipmentOptionsListModel({
    required super.id,
    required super.name,
    required super.options,
  });

  factory EquipmentOptionsListModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentOptionsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentOptionsListModelToJson(this);
}
