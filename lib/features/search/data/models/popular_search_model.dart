import 'package:auto/features/search/domain/entities/popular_search_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular_search_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PopularSearchModel extends PopularSearchEntity {
  const PopularSearchModel({super.searchText});

  factory PopularSearchModel.fromJson(Map<String, dynamic> json) =>
      _$PopularSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularSearchModelToJson(this);
}
