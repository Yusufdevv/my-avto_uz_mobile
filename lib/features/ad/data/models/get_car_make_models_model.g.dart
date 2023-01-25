// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_car_make_models_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMakeModelsModel _$GetMakeModelsModelFromJson(Map<String, dynamic> json) =>
    GetMakeModelsModel(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => const MakeModelEntityConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetMakeModelsModelToJson(GetMakeModelsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results
          .map(const MakeModelEntityConverter().toJson)
          .toList(),
    };
