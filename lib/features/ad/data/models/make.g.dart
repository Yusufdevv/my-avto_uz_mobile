// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeModel _$MakeModelFromJson(Map<String, dynamic> json) => MakeModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
    );

Map<String, dynamic> _$MakeModelToJson(MakeModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
