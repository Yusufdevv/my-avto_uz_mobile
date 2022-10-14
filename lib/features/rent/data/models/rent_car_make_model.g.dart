// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_car_make_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarMakeModel _$RentCarMakeModelFromJson(Map<String, dynamic> json) =>
    RentCarMakeModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$RentCarMakeModelToJson(RentCarMakeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
