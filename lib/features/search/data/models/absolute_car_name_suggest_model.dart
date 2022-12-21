import 'package:auto/features/search/domain/entities/absolute_car_name_suggest_completion_entity.dart';
import 'package:auto/features/search/domain/entities/option_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'absolute_car_name_suggest_model.g.dart';
@JsonSerializable(fieldRename: FieldRename.snake)
class AbsoluteCarNameSuggestModel
    extends AbsoluteCarNameSuggestCompletionEntity {
  const AbsoluteCarNameSuggestModel({
    required super.length,
    required super.offset,
    required super.options,
    required super.text,
  });
  factory AbsoluteCarNameSuggestModel.fromJson(Map<String, dynamic> json) =>
      _$AbsoluteCarNameSuggestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AbsoluteCarNameSuggestModelToJson(this);
}
