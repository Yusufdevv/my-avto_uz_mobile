// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_in_dealer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerMakeModel _$DealerMakeModelFromJson(Map<String, dynamic> json) =>
    DealerMakeModel(
      id: json['id'] as int? ?? 0,
      logo: json['logo'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$DealerMakeModelToJson(DealerMakeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
    };
