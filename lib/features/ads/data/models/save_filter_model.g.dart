// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFilterModel _$SaveFilterModelFromJson(Map<String, dynamic> json) =>
    SaveFilterModel(
      make: json['make'] as int?,
      model: (json['model'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      query: json['query'] as String?,
      queryData: const QueryDataEntityConverter()
          .fromJson(json['query_data'] as Map<String, dynamic>?),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SaveFilterModelToJson(SaveFilterModel instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'query': instance.query,
      'id': instance.id,
      'query_data':
          _$JsonConverterToJson<Map<String, dynamic>?, QueryDataEntity>(
              instance.queryData, const QueryDataEntityConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
