import 'package:auto/features/search/domain/entities/search_suggest_entity.dart';
import 'package:auto/features/search/data/models/options_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'car_suggestion_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CarSuggestionModel extends CarSuggestionEntity {
  const CarSuggestionModel({required super.options, required super.text});
  factory CarSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$CarSuggestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarSuggestionModelToJson(this);
}
