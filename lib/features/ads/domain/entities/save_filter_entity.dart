import 'package:auto/features/ads/data/models/query_data_model.dart';
import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:equatable/equatable.dart';

class SaveFilterEntity extends Equatable {
  const SaveFilterEntity({
    this.make,
    this.model,
    this.query,
    this.queryData,
    this.id,
  });

  final int? make;
  final List<int?>? model;
  final String? query;
  final int? id;
  @QueryDataEntityConverter()
  final QueryDataEntity? queryData;

  SaveFilterEntity copyWith({
    int? make,
    List<int?>? model,
    String? query,
    int? id,
    QueryDataModel? queryData,
  }) =>
      SaveFilterEntity(
        make: make ?? this.make,
        id: id ?? this.id,
        model: model ?? this.model,
        query: query ?? this.query,
        queryData: queryData ?? this.queryData,
      );

  @override
  List<Object?> get props => [make, model, query, queryData, id];
}
