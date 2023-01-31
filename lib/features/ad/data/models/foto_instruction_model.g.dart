// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto_instruction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FotoInstructionModel _$FotoInstructionModelFromJson(
        Map<String, dynamic> json) =>
    FotoInstructionModel(
      image: json['image'] as String? ?? '',
      description: json['description'] as String? ?? '',
      id: json['id'] as int? ?? -1,
      order: json['order'] as int? ?? -1,
    );

Map<String, dynamic> _$FotoInstructionModelToJson(
        FotoInstructionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'description': instance.description,
      'image': instance.image,
    };
