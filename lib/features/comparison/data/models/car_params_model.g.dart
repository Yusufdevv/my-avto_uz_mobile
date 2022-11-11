// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_params_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarParamsModel _$CarParamsModelFromJson(Map<String, dynamic> json) =>
    CarParamsModel(
      year: json['year'] as int? ?? -1,
      state: json['state'] as String? ?? '',
      generation: json['generation'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      model: json['model'] as String? ?? '',
      mark: json['mark'] as String? ?? '',
      color: json['color'] as String? ?? '',
      numberOfOwners: json['number_of_owners'] as int? ?? -1,
      probeg: json['probeg'] as String? ?? '',
      razgon: json['razgon'] as String? ?? '',
      type: json['type'] as String? ?? '',
      volume: json['volume'] as String? ?? '',
    );

Map<String, dynamic> _$CarParamsModelToJson(CarParamsModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'mark': instance.mark,
      'model': instance.model,
      'generation': instance.generation,
      'year': instance.year,
      'number_of_owners': instance.numberOfOwners,
      'probeg': instance.probeg,
      'state': instance.state,
      'color': instance.color,
      'razgon': instance.razgon,
      'volume': instance.volume,
      'type': instance.type,
    };
