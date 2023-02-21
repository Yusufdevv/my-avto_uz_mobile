import 'package:equatable/equatable.dart';

class GasEquipmentEntity extends Equatable {
  final int id;
  final String name;

  const GasEquipmentEntity({
    this.id = -1,
    this.name = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
