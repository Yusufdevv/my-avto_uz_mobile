import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:auto/features/ads/domain/entities/search_history_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_history_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchHistoryModel extends SearchHistoryEntity {
  const SearchHistoryModel({
    super.make,
    super.model,
    super.query,
    super.queryData,
  });

  @override
  SearchHistoryModel copyWith({
    int? make,
    List<int?>? model,
    String? query,
    QueryDataEntity? queryData,
  }) =>
      SearchHistoryModel(
        make: make,
        model: model,
        query: query??'Query',
        queryData: queryData,
      );

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHistoryModelToJson(this);
}
