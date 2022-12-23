import 'package:auto/features/common/domain/model/car_dealer_model.dart';
import 'package:auto/features/common/domain/entity/car_district_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class CarDealerEntity extends Equatable {
  const CarDealerEntity({
    this.id = -1,
    this.name = '',
    this.slug = '',
    this.description = '',
    this.phone = '',
    this.contactFrom = '',
    this.contactTo = '',
    this.longitude = 0,
    this.latitude = 0,
    this.district = const CarDistrictEntity(),
    this.type,
    this.carCount = 0,
  });

  final int id;
  final String name;
  final String slug;
  final String description;
  final String phone;
  final String contactFrom;
  final String contactTo;
  final double longitude;
  final double latitude;
  @CarDistrictConverter()
  final CarDistrictEntity district;
  final dynamic type;
  final int carCount;

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        phone,
        contactFrom,
        contactTo,
        longitude,
        latitude,
        district,
        type,
        carCount
      ];
}

class CarDealerConverter
    implements JsonConverter<CarDealerEntity, Map<String, dynamic>?> {
  const CarDealerConverter();
  @override
  CarDealerEntity fromJson(Map<String, dynamic>? json) =>
      CarDealerModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(CarDealerEntity object) => CarDealerModel(
        id: object.id,
        name: object.name,
        slug: object.slug,
        description: object.description,
        phone: object.phone,
        contactFrom: object.contactFrom,
        contactTo: object.contactTo,
        longitude: object.longitude,
        latitude: object.latitude,
        district: object.district,
        type: object.type,
        carCount: object.carCount,
      ).toJson();
}
