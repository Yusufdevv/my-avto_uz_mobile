// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_modification_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarModificationTypeModel _$CarModificationTypeModelFromJson(
        Map<String, dynamic> json) =>
    CarModificationTypeModel(
      id: json['id'] as int? ?? -1,
      power: json['power'] as String? ?? '',
      volume: json['volume'] as String? ?? '',
    );

Map<String, dynamic> _$CarModificationTypeModelToJson(
        CarModificationTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'power': instance.power,
      'volume': instance.volume,
    };
