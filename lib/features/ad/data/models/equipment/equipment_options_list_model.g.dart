// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_options_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentOptionsListModel _$EquipmentOptionsListModelFromJson(
        Map<String, dynamic> json) =>
    EquipmentOptionsListModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => const EquipmentOptionConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EquipmentOptionsListModelToJson(
        EquipmentOptionsListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'options': instance.options
          .map(const EquipmentOptionConverter().toJson)
          .toList(),
    };
