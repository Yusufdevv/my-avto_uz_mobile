import 'package:auto/features/common/domain/model/question_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class QuestionEntity extends Equatable {
  const QuestionEntity({
    this.id = -1,
    this.title = '',
  });

  final int id;
  final String title;

  @override
  List<Object?> get props => [id, title];
}

class QuestionConverter
    implements JsonConverter<QuestionEntity, Map<String, dynamic>?> {
  const QuestionConverter();

  @override
  QuestionEntity fromJson(Map<String, dynamic>? json) =>
      QuestionModel.fromJson(json ?? {});

  @override
  Map<String, dynamic> toJson(QuestionEntity object) =>
      QuestionModel(id: object.id, title: object.title).toJson();
}
