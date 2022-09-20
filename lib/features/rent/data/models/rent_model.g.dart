// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentModel _$RentModelFromJson(Map<String, dynamic> json) => RentModel(
      id: json['id'] as int? ?? 0,
      minDrivingExperience: json['min_driving_experience'] as int? ?? 0,
      minAge: json['min_age'] as int? ?? 0,
      price: json['price'] as String? ?? '',
      region: json['region'] == null
          ? const RegionEntity()
          : const RegionConverter()
              .fromJson(json['region'] as Map<String, dynamic>?),
      rentCar: json['rent_car'] == null
          ? const RentCarEntity()
          : const RentCarConverter()
              .fromJson(json['rent_car'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$RentModelToJson(RentModel instance) => <String, dynamic>{
      'id': instance.id,
      'rent_car': const RentCarConverter().toJson(instance.rentCar),
      'region': const RegionConverter().toJson(instance.region),
      'price': instance.price,
      'min_age': instance.minAge,
      'min_driving_experience': instance.minDrivingExperience,
    };
