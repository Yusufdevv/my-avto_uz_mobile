// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_searches_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularSearchesModel _$PopularSearchesModelFromJson(
        Map<String, dynamic> json) =>
    PopularSearchesModel(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => const PopularSearchesResultConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PopularSearchesModelToJson(
        PopularSearchesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results
          .map(const PopularSearchesResultConverter().toJson)
          .toList(),
    };
