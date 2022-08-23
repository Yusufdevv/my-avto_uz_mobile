// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericPagination<T> _$GenericPaginationFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GenericPagination<T>(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String? ?? '',
      results:
          (json['results'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
    );

Map<String, dynamic> _$GenericPaginationToJson<T>(
  GenericPagination<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map(toJsonT).toList(),
      'next': instance.next,
    };
