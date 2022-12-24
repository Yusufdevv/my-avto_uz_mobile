import 'package:auto/features/search/domain/entities/search_suggest_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_suggest_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchSuggestModel extends SearchSuggestEntity {
  const SearchSuggestModel({required super.absoluteCarNameSuggestCompletion});
  factory SearchSuggestModel.fromJson(Map<String, dynamic> json) =>
      _$SearchSuggestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSuggestModelToJson(this);
}
