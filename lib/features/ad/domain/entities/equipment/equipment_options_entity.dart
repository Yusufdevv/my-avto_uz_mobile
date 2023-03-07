import 'package:auto/features/ad/data/models/equipment/equipment_options_model.dart';
import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:auto/features/ad/domain/entities/equipment/id_name_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class EquipmentOptionsEntity extends Equatable {
  final int id;
  @EquipmentOptionConverter()
  final EquipmentOptionEntity option;
  @IdNameConverter()
  final IdNameEntity item;

  const EquipmentOptionsEntity({
    this.id = -1,
    this.option = const EquipmentOptionEntity(),
    this.item = const IdNameEntity(),
  });

  @override
  List<Object?> get props => [id, option, item];
}

class EquipmentOptionsConverter
    implements JsonConverter<EquipmentOptionsEntity, Map<String, dynamic>?> {
  const EquipmentOptionsConverter();

  @override
  EquipmentOptionsEntity fromJson(Map<String, dynamic>? json) =>
      EquipmentOptionsModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(EquipmentOptionsEntity object) => {};
}
