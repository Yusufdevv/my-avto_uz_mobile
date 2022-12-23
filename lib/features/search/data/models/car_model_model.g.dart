// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModelModel _$CarModelModelFromJson(Map<String, dynamic> json) =>
    CarModelModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      make: json['make'] as int? ?? 0,
    );

Map<String, dynamic> _$CarModelModelToJson(CarModelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'make': instance.make,
    };
