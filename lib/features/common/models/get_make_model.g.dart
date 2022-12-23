// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_make_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMakeModel _$GetMakeModelFromJson(Map<String, dynamic> json) => GetMakeModel(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String? ?? '',
      previous: json['previous'] as String? ?? '',
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => const MakeEntityConverter()
                  .fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GetMakeModelToJson(GetMakeModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results':
          instance.results.map(const MakeEntityConverter().toJson).toList(),
    };
