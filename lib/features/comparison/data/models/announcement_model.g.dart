// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementsModel _$AnnouncementsModelFromJson(Map<String, dynamic> json) =>
    AnnouncementsModel(
      id: json['id'] as int? ?? 0,
      licenceType: json['licence_type'] as String? ?? '',
      ownership: json['ownership'] as String? ?? '',
      isRegisteredLocally: json['is_registered_locally'] as bool? ?? true,
      isNew: json['is_new'] as bool? ?? true,
      price: json['price'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      make: json['make'] as String? ?? '',
      model: json['model'] as String? ?? '',
      generation: json['generation'] as String? ?? '',
      bodyType: json['body_type'] as String? ?? '',
      driveType: json['drive_type'] as String? ?? '',
      engineType: json['engine_type'] as String? ?? '',
      gearboxType: json['gearbox_type'] as String? ?? '',
      year: json['year'] as int? ?? 2002,
      color: json['color'] as String? ?? '',
      power: json['power'] as String? ?? '',
      volume: json['volume'] as String? ?? '',
    );

Map<String, dynamic> _$AnnouncementsModelToJson(AnnouncementsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'licence_type': instance.licenceType,
      'ownership': instance.ownership,
      'is_registered_locally': instance.isRegisteredLocally,
      'is_new': instance.isNew,
      'price': instance.price,
      'currency': instance.currency,
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'body_type': instance.bodyType,
      'drive_type': instance.driveType,
      'engine_type': instance.engineType,
      'gearbox_type': instance.gearboxType,
      'year': instance.year,
      'color': instance.color,
      'power': instance.power,
      'volume': instance.volume,
    };
