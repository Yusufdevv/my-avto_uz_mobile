// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_in_dealer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeModel _$MakeModelFromJson(Map<String, dynamic> json) => MakeModel(
      id: json['id'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$MakeModelToJson(MakeModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
    };
