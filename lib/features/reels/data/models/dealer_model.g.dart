// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealerModel _$DealerModelFromJson(Map<String, dynamic> json) => DealerModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$DealerModelToJson(DealerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'slug': instance.slug,
    };
