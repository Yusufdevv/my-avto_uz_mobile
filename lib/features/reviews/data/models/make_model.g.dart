// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeModel _$MakeModelFromJson(Map<String, dynamic> json) => MakeModel(
      id: json['id'] as int? ?? -1,
      logo: json['logo'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$MakeModelToJson(MakeModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
