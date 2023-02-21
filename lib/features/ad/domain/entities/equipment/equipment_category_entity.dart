import 'package:auto/features/ad/data/models/equipment/equipment_category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class EquipmentCategoryEntity extends Equatable {
  final int id;
  final String name;

  const EquipmentCategoryEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class EquipmentCategoryConverter
    implements JsonConverter<EquipmentCategoryEntity, Map<String, dynamic>?> {
  const EquipmentCategoryConverter();

  @override
  EquipmentCategoryEntity fromJson(Map<String, dynamic>? json) =>
      EquipmentCategoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(EquipmentCategoryEntity object) => {};
}
