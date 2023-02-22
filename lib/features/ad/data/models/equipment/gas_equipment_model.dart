import 'package:auto/features/ad/domain/entities/equipment/gas_equipment_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gas_equipment_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GasEquipmentModel extends GasEquipmentEntity {
  const GasEquipmentModel({
    required super.id,
    required super.name,
  });

  factory GasEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$GasEquipmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$GasEquipmentModelToJson(this);
}
