import 'package:auto/features/search/domain/entities/popular_searches_result_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_searches_result_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PopularSearchesResultModel extends PopularSearchesResultEntity {
  const PopularSearchesResultModel({super.id, super.searchText});

  factory PopularSearchesResultModel.fromJson(Map<String, dynamic> json) =>
      _$PopularSearchesResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularSearchesResultModelToJson(this);
}
