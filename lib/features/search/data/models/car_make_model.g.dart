// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_make_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarMakeModel _$CarMakeModelFromJson(Map<String, dynamic> json) => CarMakeModel(
      id: json['id'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$CarMakeModelToJson(CarMakeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
    };
