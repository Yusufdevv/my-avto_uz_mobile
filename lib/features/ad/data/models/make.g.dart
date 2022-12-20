// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeModel _$MakeModelFromJson(Map<String, dynamic> json) => MakeModel(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$MakeModelToJson(MakeModel instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'logo': instance.logo,
    };
