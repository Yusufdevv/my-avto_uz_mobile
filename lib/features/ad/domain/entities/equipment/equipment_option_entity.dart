import 'package:auto/features/ad/data/models/equipment/equipment_option_model.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_category_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class EquipmentOptionEntity extends Equatable {
  final int id;
  final String name;
  @EquipmentCategoryConverter()
  final EquipmentCategoryEntity category;
  final String type;

  const EquipmentOptionEntity({
    this.id = -1,
    this.name = '',
    this.category = const EquipmentCategoryEntity(),
    this.type = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        type,
      ];
}

class EquipmentOptionConverter
    implements JsonConverter<EquipmentOptionEntity, Map<String, dynamic>?> {
  const EquipmentOptionConverter();

  @override
  EquipmentOptionEntity fromJson(Map<String, dynamic>? json) =>
      EquipmentOptionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(EquipmentOptionEntity object) => {};
}
