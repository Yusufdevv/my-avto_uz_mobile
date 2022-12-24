// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalServiceModel _$AdditionalServiceModelFromJson(
        Map<String, dynamic> json) =>
    AdditionalServiceModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      price: json['price'] as String? ?? '',
    );

Map<String, dynamic> _$AdditionalServiceModelToJson(
        AdditionalServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
