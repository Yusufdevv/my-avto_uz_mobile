// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopBrandModel _$TopBrandModelFromJson(Map<String, dynamic> json) =>
    TopBrandModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$TopBrandModelToJson(TopBrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
