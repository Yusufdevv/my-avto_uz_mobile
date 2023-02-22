// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyTypeModel _$BodyTypeModelFromJson(Map<String, dynamic> json) =>
    BodyTypeModel(
      id: json['id'] as int? ?? -1,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$BodyTypeModelToJson(BodyTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
