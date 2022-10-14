// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_car_bodytype_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarBodyTypeModel _$RentCarBodyTypeModelFromJson(
        Map<String, dynamic> json) =>
    RentCarBodyTypeModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$RentCarBodyTypeModelToJson(
        RentCarBodyTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
