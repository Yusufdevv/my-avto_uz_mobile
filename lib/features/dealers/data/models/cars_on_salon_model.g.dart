// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_on_salon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarsOnSalonModel _$CarsOnSalonModelFromJson(Map<String, dynamic> json) =>
    CarsOnSalonModel(
      mark: json['mark'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String,
      mileage: json['mileage'] as int,
    );

Map<String, dynamic> _$CarsOnSalonModelToJson(CarsOnSalonModel instance) =>
    <String, dynamic>{
      'mark': instance.mark,
      'amount': instance.amount,
      'mileage': instance.mileage,
      'description': instance.description,
    };
