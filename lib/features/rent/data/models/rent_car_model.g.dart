// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_car_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarModel _$RentCarModelFromJson(Map<String, dynamic> json) => RentCarModel(
      id: json['id'] as int? ?? 0,
      gallery: (json['gallery'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isFullFuel: json['is_full_fuel'] as bool? ?? false,
      hasBabySeat: json['has_baby_seat'] as bool? ?? false,
      hasAirConditioner: json['has_air_conditioner'] as bool? ?? false,
      distanceTraveled: json['distance_traveled'] as int? ?? 0,
      color: json['color'] as String? ?? '',
      engineVolume: json['engine_volume'] as int? ?? 0,
      engineType: json['engine_type'] as String? ?? '',
      gearboxType: json['gearbox_type'] as String? ?? '',
      equipmentType: json['equipment_type'] as String? ?? '',
      driveType: json['drive_type'] as String? ?? '',
      year: json['year'] as int? ?? 0,
      bodyType: json['body_type'] as String? ?? '',
      generation: json['generation'] as String? ?? '',
      model: json['model'] as String? ?? '',
      make: json['make'] as String? ?? '',
      category: json['category'] == null
          ? const RentCarCategoryEntity()
          : const RentCarCategoryConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      type: json['type'] == null
          ? const RentCarTypeEntity()
          : const RentCarTypeConverter()
              .fromJson(json['type'] as Map<String, dynamic>?),
      isClean: json['is_clean'] as bool? ?? false,
    );

Map<String, dynamic> _$RentCarModelToJson(RentCarModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const RentCarTypeConverter().toJson(instance.type),
      'category': const RentCarCategoryConverter().toJson(instance.category),
      'make': instance.make,
      'model': instance.model,
      'generation': instance.generation,
      'body_type': instance.bodyType,
      'year': instance.year,
      'drive_type': instance.driveType,
      'equipment_type': instance.equipmentType,
      'gearbox_type': instance.gearboxType,
      'engine_type': instance.engineType,
      'engine_volume': instance.engineVolume,
      'color': instance.color,
      'distance_traveled': instance.distanceTraveled,
      'has_air_conditioner': instance.hasAirConditioner,
      'has_baby_seat': instance.hasBabySeat,
      'is_clean': instance.isClean,
      'is_full_fuel': instance.isFullFuel,
      'gallery': instance.gallery,
    };
