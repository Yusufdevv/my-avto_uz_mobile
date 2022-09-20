import 'package:auto/features/common/converter/entity_converter.dart';
import 'package:auto/features/rent/data/models/rent_car_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:equatable/equatable.dart';

class RentEntity extends Equatable {
  final int id;

  @RentCarConverter()
  final RentCarEntity rentCar;
  @RegionConverter()
  final RegionEntity region;
  final String price;
  final int minAge;
  final int minDrivingExperience;

  const RentEntity({
    this.id = 0,
    this.rentCar = const RentCarEntity(),
    this.region = const RegionEntity(),
    this.price = '',
    this.minAge = 0,
    this.minDrivingExperience = 0,
  });

  @override
  List<Object?> get props => [
        id,
        rentCar,
        region,
        price,
        minAge,
        minDrivingExperience,
      ];
}
