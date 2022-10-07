// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_car_modification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarModificationModel _$RentCarModificationModelFromJson(
        Map<String, dynamic> json) =>
    RentCarModificationModel(
      id: json['id'] as int? ?? 0,
      power: json['power'] as String? ?? '',
      volume: json['volume'] as String? ?? '',
    );

Map<String, dynamic> _$RentCarModificationModelToJson(
        RentCarModificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'power': instance.power,
      'volume': instance.volume,
    };
