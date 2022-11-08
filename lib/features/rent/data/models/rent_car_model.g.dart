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
      engineVolume: (json['engine_volume'] as num?)?.toDouble() ?? 0.0,
      engineType: json['engine_type'] == null
          ? const RentCarBodyTypeEntity()
          : const RentCarBodyTypeConverter()
              .fromJson(json['engine_type'] as Map<String, dynamic>?),
      gearboxType: json['gearbox_type'] == null
          ? const RentCarBodyTypeEntity()
          : const RentCarBodyTypeConverter()
              .fromJson(json['gearbox_type'] as Map<String, dynamic>?),
      modificationType: json['modification_type'] == null
          ? const RentCarModificationEntity()
          : const RentCarModificationConverter()
              .fromJson(json['modification_type'] as Map<String, dynamic>?),
      driveType: json['drive_type'] == null
          ? const RentCarBodyTypeEntity()
          : const RentCarBodyTypeConverter()
              .fromJson(json['drive_type'] as Map<String, dynamic>?),
      year: json['year'] as int? ?? 0,
      bodyType: json['body_type'] == null
          ? const RentCarBodyTypeEntity()
          : const RentCarBodyTypeConverter()
              .fromJson(json['body_type'] as Map<String, dynamic>?),
      generation: json['generation'] == null
          ? const RentCarGenerationEntity()
          : const RentCarGenerationConverter()
              .fromJson(json['generation'] as Map<String, dynamic>?),
      model: json['model'] == null
          ? const RentCarModelsEntity()
          : const RentCarModelsConverter()
              .fromJson(json['model'] as Map<String, dynamic>?),
      make: json['make'] == null
          ? const RentCarMakeEntity()
          : const RentCarMakeConverter()
              .fromJson(json['make'] as Map<String, dynamic>?),
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
      'make': const RentCarMakeConverter().toJson(instance.make),
      'model': const RentCarModelsConverter().toJson(instance.model),
      'generation':
          const RentCarGenerationConverter().toJson(instance.generation),
      'body_type': const RentCarBodyTypeConverter().toJson(instance.bodyType),
      'year': instance.year,
      'drive_type': const RentCarBodyTypeConverter().toJson(instance.driveType),
      'modification_type': const RentCarModificationConverter()
          .toJson(instance.modificationType),
      'gearbox_type':
          const RentCarBodyTypeConverter().toJson(instance.gearboxType),
      'engine_type':
          const RentCarBodyTypeConverter().toJson(instance.engineType),
      'engine_volume': instance.engineVolume,
      'color': instance.color,
      'distance_traveled': instance.distanceTraveled,
      'has_air_conditioner': instance.hasAirConditioner,
      'has_baby_seat': instance.hasBabySeat,
      'is_clean': instance.isClean,
      'is_full_fuel': instance.isFullFuel,
      'gallery': instance.gallery,
    };
