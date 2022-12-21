import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';


class RentCarSingleEntity {
  RentCarSingleEntity({
    required this.id,
    required this.rentCar,
    required this.region,
    required this.price,
    required this.minAge,
    required this.minDrivingExperience,
  });

  final int id;
  final RentCarEntity rentCar;
  final RegionEntity region;
  final String price;
  final int minAge;
  final int minDrivingExperience;

  RentCarSingleEntity copyWith({
    int? id,
    RentCarEntity? rentCar,
    RegionEntity? region,
    String? price,
    int? minAge,
    int? minDrivingExperience,
  }) =>
      RentCarSingleEntity(
        id: id ?? this.id,
        rentCar: rentCar ?? this.rentCar,
        region: region ?? this.region,
        price: price ?? this.price,
        minAge: minAge ?? this.minAge,
        minDrivingExperience: minDrivingExperience ?? this.minDrivingExperience,
      );
}
