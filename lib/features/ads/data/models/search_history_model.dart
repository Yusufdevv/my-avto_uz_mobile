import 'package:auto/features/ads/domain/entities/query_data_entity.dart';
import 'package:auto/features/ads/domain/entities/search_history_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_history_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchHistoryModel extends SearchHistoryEntity {
  const SearchHistoryModel({
    required super.id,
    required super.make,
    required super.model,
    required super.query,
    required super.queryData,
  });

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$SearchHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHistoryModelToJson(this);
}
