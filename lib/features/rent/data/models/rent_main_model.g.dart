// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentMainModel _$RentMainModelFromJson(Map<String, dynamic> json) =>
    RentMainModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      rentCars: (json['rent_cars'] as List<dynamic>?)
              ?.map((e) =>
                  const RentCarConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RentMainModelToJson(RentMainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rent_cars':
          instance.rentCars.map(const RentCarConverter().toJson).toList(),
    };
