import 'package:auto/features/common/domain/entity/question_entity.dart';
import 'package:auto/features/common/domain/model/star_answer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class StarAnswerEntity extends Equatable {
  const StarAnswerEntity({
    this.question = const QuestionEntity(),
    this.starCount = 0,
  });
  @QuestionConverter()
  final QuestionEntity question;
  final int starCount;

  @override
  List<Object?> get props => [question, starCount];
}

class StarAnswerConverter
    implements JsonConverter<StarAnswerEntity, Map<String, dynamic>?> {
  const StarAnswerConverter();

  @override
  StarAnswerEntity fromJson(Map<String, dynamic>? json) =>
      StarAnswerModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(StarAnswerEntity object) =>
      StarAnswerModel(question: object.question, starCount: object.starCount)
          .toJson();
}
