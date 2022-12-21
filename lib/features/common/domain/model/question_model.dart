import 'package:auto/features/common/domain/entity/question_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'question_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class QuestionModel extends QuestionEntity {
  const QuestionModel({required super.id, required super.title});
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
