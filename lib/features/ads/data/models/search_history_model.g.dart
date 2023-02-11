// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveFilterModel _$SaveFilterModelFromJson(Map<String, dynamic> json) =>
    SaveFilterModel(
      make: json['make'] as int?,
      model: (json['model'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      query: json['query'] as String?,
      queryData: json['query_data'] == null
          ? null
          : QueryDataModel.fromJson(json['query_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SaveFilterModelToJson(SaveFilterModel instance) =>
    <String, dynamic>{
      'make': instance.make,
      'model': instance.model,
      'query': instance.query,
      'query_data': instance.queryData,
    };
