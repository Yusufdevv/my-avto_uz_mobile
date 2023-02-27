// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentOptionModel _$EquipmentOptionModelFromJson(
        Map<String, dynamic> json) =>
    EquipmentOptionModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      category: json['category'] == null
          ? const EquipmentCategoryEntity()
          : const EquipmentCategoryConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      type: json['type'] as String? ?? '',
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => const EquipmentCategoryConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EquipmentOptionModelToJson(
        EquipmentOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': const EquipmentCategoryConverter().toJson(instance.category),
      'type': instance.type,
      'items': instance.items
          .map(const EquipmentCategoryConverter().toJson)
          .toList(),
    };
