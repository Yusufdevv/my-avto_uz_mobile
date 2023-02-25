import 'package:auto/features/ad/domain/entities/equipment/equipment_option_entity.dart';
import 'package:equatable/equatable.dart';

class EquipmentOptionsListEntity extends Equatable {
  final int id;
  final String name;
  @EquipmentOptionConverter()
  final List<EquipmentOptionEntity> options;

  const EquipmentOptionsListEntity({
    this.id = -1,
    this.name = '',
    this.options = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        options,
      ];
}
