// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) => TypeModel(
      id: json['id'] as int? ?? -1,
      logo: json['logo'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$TypeModelToJson(TypeModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
