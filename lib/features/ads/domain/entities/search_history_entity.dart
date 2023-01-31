import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:equatable/equatable.dart';

class SearchHistoryEntity extends Equatable {
  const SearchHistoryEntity({
    this.id = 0,
    this.make = 0,
    this.model = const [],
    this.query = '',
    this.queryData = const QueryDataEntity(),
  });

  final int id;
  final int make;
  final List<int> model;
  final String query;
  final QueryDataEntity queryData;

  @override
  List<Object?> get props => [id, make, model, query, queryData];
}
