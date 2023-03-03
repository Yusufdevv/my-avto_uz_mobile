// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentOptionsModel _$EquipmentOptionsModelFromJson(
        Map<String, dynamic> json) =>
    EquipmentOptionsModel(
      id: json['id'] as int? ?? -1,
      option: json['option'] == null
          ? const EquipmentOptionEntity()
          : const EquipmentOptionConverter()
              .fromJson(json['option'] as Map<String, dynamic>?),
      item: json['item'] == null
          ? const IdNameEntity()
          : const IdNameConverter()
              .fromJson(json['item'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$EquipmentOptionsModelToJson(
        EquipmentOptionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'option': const EquipmentOptionConverter().toJson(instance.option),
      'item': const IdNameConverter().toJson(instance.item),
    };
