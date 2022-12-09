// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_single_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSingleModel _$CarSingleModelFromJson(Map<String, dynamic> json) =>
    CarSingleModel(
      date: json['date'] as String? ?? '',
      carComplectation: (json['car_complectation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      autoName: json['auto_name'] as String? ?? '',
      views: json['views'] as String? ?? '',
      price: json['price'] as String? ?? '',
    );

Map<String, dynamic> _$CarSingleModelToJson(CarSingleModel instance) =>
    <String, dynamic>{
      'auto_name': instance.autoName,
      'price': instance.price,
      'date': instance.date,
      'views': instance.views,
      'car_complectation': instance.carComplectation,
    };
