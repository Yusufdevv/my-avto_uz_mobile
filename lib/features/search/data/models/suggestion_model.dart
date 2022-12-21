import 'package:auto/features/search/domain/entities/absolute_car_name_suggest_completion_entity.dart';
import 'package:auto/features/search/domain/entities/suggestion_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggestion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SuggestionModel extends SuggestionEntity {
  const SuggestionModel({super.absoluteCarNameSuggestCompletion});

  factory SuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionModelToJson(this);
}
