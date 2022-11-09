// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_searches_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularSearchesResultModel _$PopularSearchesResultModelFromJson(
        Map<String, dynamic> json) =>
    PopularSearchesResultModel(
      id: json['id'] as int? ?? 0,
      searchText: json['search_text'] as String? ?? '',
    );

Map<String, dynamic> _$PopularSearchesResultModelToJson(
        PopularSearchesResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'search_text': instance.searchText,
    };
