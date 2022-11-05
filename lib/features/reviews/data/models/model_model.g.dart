// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelModel _$ModelModelFromJson(Map<String, dynamic> json) => ModelModel(
      id: json['id'] as int? ?? 0,
      make: json['make'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$ModelModelToJson(ModelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'make': instance.make,
    };
