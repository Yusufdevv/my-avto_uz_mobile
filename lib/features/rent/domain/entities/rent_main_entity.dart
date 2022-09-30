import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:equatable/equatable.dart';

class RentMainEntity extends Equatable {
  final int id;
  final String name;
  @RentCarConverter()
  final List<RentCarEntity> rentCars;

  const RentMainEntity({
    this.id = 0,
    this.name = '',
    this.rentCars = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        rentCars,
      ];
}
