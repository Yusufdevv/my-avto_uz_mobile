// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHistoryModel _$SearchHistoryModelFromJson(Map<String, dynamic> json) =>
    SearchHistoryModel(
      id: json['id'] as int? ?? 0,
      make: json['make'] as int? ?? 0,
      model: (json['model'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      query: json['query'] as String? ?? '',
      queryData: json['query_data'] == null
          ? const QueryDataEntity()
          : const QueryDataConverter()
              .fromJson(json['query_data'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$SearchHistoryModelToJson(SearchHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'query': instance.query,
      'query_data':
          _$JsonConverterToJson<Map<String, dynamic>?, QueryDataEntity>(
              instance.queryData, const QueryDataConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
