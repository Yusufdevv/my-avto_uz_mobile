import 'package:auto/features/ads/data/models/search_history_model.dart';
import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class SearchHistoryEntity extends Equatable {
  const SearchHistoryEntity({
    this.make = 0,
    this.model = const [0],
    this.query = 'nima',
    this.queryData = const QueryDataEntity(),
  });

  final int? make;
  final List<int?>? model;
  final String? query;
  @QueryDataConverter()
  final QueryDataEntity? queryData;

  SearchHistoryEntity copyWith({
    int? make,
    List<int?>? model,
    String? query,
    QueryDataEntity? queryData,
  }) =>
      SearchHistoryEntity(
        make: make,
        model: model,
        query: query,
        queryData: queryData,
      );

  @override
  List<Object?> get props => [ make, model, query, queryData];
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
