import 'package:auto/features/common/domain/entity/question_entity.dart';
import 'package:auto/features/common/domain/entity/star_answer_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'star_answer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StarAnswerModel extends StarAnswerEntity {
  const StarAnswerModel({required super.question, required super.starCount});
  factory StarAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$StarAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$StarAnswerModelToJson(this);
}
