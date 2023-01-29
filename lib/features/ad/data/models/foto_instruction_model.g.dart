// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto_instruction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FotoInstructionModel _$FotoInstructionModelFromJson(
        Map<String, dynamic> json) =>
    FotoInstructionModel(
      image: json['image'] as String? ?? '',
      instruction: json['instruction'] as String? ?? '',
    );

Map<String, dynamic> _$FotoInstructionModelToJson(
        FotoInstructionModel instance) =>
    <String, dynamic>{
      'instruction': instance.instruction,
      'image': instance.image,
    };
