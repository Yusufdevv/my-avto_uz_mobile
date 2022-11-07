import 'package:auto/features/reviews/data/models/star_answer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class StarAnswerEntity extends Equatable {
  const StarAnswerEntity({
    this.question = 0,
    this.starCount = 0,
  });

  final int question;
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
  Map<String, dynamic>? toJson(StarAnswerEntity object) => {};
}
