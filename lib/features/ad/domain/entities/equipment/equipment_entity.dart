import 'package:auto/features/ad/data/models/equipment/equipment_model.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_options_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class EquipmentEntity extends Equatable {
  final int id;
  final String name;
  final int model;
  @EquipmentOptionsConverter()
  final List<EquipmentOptionsEntity> options;

  const EquipmentEntity({
    this.id = -1,
    this.name = '',
    this.model = -1,
    this.options = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        model,
        options,
      ];
}

class EquipmentConverter
    implements JsonConverter<EquipmentEntity, Map<String, dynamic>?> {
  const EquipmentConverter();

  @override
  EquipmentEntity fromJson(Map<String, dynamic>? json) =>
      EquipmentModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(EquipmentEntity object) => EquipmentModel(
        id: object.id,
        name: object.name,
        model: object.model,
        options: object.options,
      ).toJson();
}
