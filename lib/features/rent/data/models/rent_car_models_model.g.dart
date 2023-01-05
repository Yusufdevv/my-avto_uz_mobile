// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_car_models_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarModelsModel _$RentCarModelsModelFromJson(Map<String, dynamic> json) =>
    RentCarModelsModel(
      id: json['id'] as int? ?? 1,
      name: json['name'] as String? ?? '',
      make: json['make'] as int? ?? 0,
    );

Map<String, dynamic> _$RentCarModelsModelToJson(RentCarModelsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'make': instance.make,
    };
