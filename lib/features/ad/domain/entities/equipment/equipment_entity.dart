import 'package:auto/features/ad/domain/entities/equipment/equipment_options_entity.dart';
import 'package:equatable/equatable.dart';

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
