// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentModel _$EquipmentModelFromJson(Map<String, dynamic> json) =>
    EquipmentModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      model: json['model'] as int? ?? -1,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => const EquipmentOptionsConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EquipmentModelToJson(EquipmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model': instance.model,
      'options': instance.options
          .map(const EquipmentOptionsConverter().toJson)
          .toList(),
    };
