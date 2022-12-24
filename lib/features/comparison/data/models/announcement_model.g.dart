// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementsModel _$AnnouncementsModelFromJson(Map<String, dynamic> json) =>
    AnnouncementsModel(
      id: json['id'] as int? ?? -1,
      licenceType: json['licence_type'] as String? ?? '',
      ownership: json['ownership'] as String? ?? '',
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? false,
      isNew: json['is_new'] as bool? ?? false,
      price: json['price'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      dimensions: json['dimensions'],
      engineData: json['engine_data'] == null
          ? const EngineDataEntity()
          : const EngineDataConverter()
              .fromJson(json['engine_data'] as Map<String, dynamic>?),
      mainData: json['main_data'] == null
          ? const MainDataEntity()
          : const MainDataConverter()
              .fromJson(json['main_data'] as Map<String, dynamic>?),
      other: json['other'],
      suspensionsAndBrakes: json['suspensions_and_brakes'],
      volumeAndMass: json['volume_and_mass'],
    );

Map<String, dynamic> _$AnnouncementsModelToJson(AnnouncementsModel instance) =>
    <String, dynamic>{
      'main_data': const MainDataConverter().toJson(instance.mainData),
      'engine_data': const EngineDataConverter().toJson(instance.engineData),
      'dimensions': instance.dimensions,
      'volume_and_mass': instance.volumeAndMass,
      'suspensions_and_brakes': instance.suspensionsAndBrakes,
      'other': instance.other,
      'id': instance.id,
      'licence_type': instance.licenceType,
      'ownership': instance.ownership,
      'is_registered_locally': instance.isRegisteredLocally,
      'is_new': instance.isNew,
      'price': instance.price,
      'currency': instance.currency,
    };
