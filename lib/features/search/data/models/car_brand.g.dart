// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarBrand _$CarBrandFromJson(Map<String, dynamic> json) => CarBrand(
      name: json['name'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      logo: ImageModel.fromJson(json['logo'] as Map<String, dynamic>),
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$CarBrandToJson(CarBrand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
    };
