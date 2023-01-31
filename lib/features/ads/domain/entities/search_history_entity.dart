import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SearchHistoryEntity extends Equatable {
  const SearchHistoryEntity({
    this.id = 0,
    this.make = 0,
    this.model = const [],
    this.query = '',
    this.queryData = const QueryDataEntity(),
  });

  final int? id;
  final int? make;
  final List<int>? model;
  final String? query;
  @QueryDataConverter()
  final QueryDataEntity? queryData;

  @override
  List<Object?> get props => [id, make, model, query, queryData];
}

class SearchHistoryConverter
    implements JsonConverter<SearchHistoryEntity, Map<String, dynamic>?> {
  const SearchHistoryConverter();
  @override
  SearchHistoryEntity fromJson(Map<String, dynamic>? json) =>
      SearchHistoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(SearchHistoryEntity object) => {};
}
