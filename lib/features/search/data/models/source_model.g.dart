// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourceModel _$SourceModelFromJson(Map<String, dynamic> json) => SourceModel(
      id: json['id'] as int? ?? -1,
      carMake: json['car_make'] == null
          ? const CarMakeEntity()
          : const CarMakeConverter()
              .fromJson(json['car_make'] as Map<String, dynamic>?),
      absoluteCarName: json['absolute_car_name'] as String? ?? '',
      vehicleType: json['vehicle_type'] as String? ?? '',
    );

Map<String, dynamic> _$SourceModelToJson(SourceModel instance) =>
    <String, dynamic>{
      'absolute_car_name': instance.absoluteCarName,
      'id': instance.id,
      'car_make': const CarMakeConverter().toJson(instance.carMake),
      'vehicle_type': instance.vehicleType,
    };
