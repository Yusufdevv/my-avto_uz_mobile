import 'package:auto/features/rent/data/models/rent_list_model.dart';
import 'package:auto/features/rent/domain/entities/region_entity.dart';
import 'package:auto/features/rent/domain/entities/rent_car_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class RentListEntity extends Equatable {
  final int id;
  @RentCarConverter()
  final RentCarEntity rentCar;
  @RegionConverter()
  final RegionEntity region;
  final String price;
  final int minAge;
  final int minDrivingExperience;

  const RentListEntity({
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

class RentListConverter
    implements JsonConverter<RentListEntity, Map<String, dynamic>?> {
  const RentListConverter();

  @override
  RentListEntity fromJson(Map<String, dynamic>? json) =>
      RentListModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(RentListEntity object) => {};
}
