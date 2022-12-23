// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarAnswerModel _$StarAnswerModelFromJson(Map<String, dynamic> json) =>
    StarAnswerModel(
      question: json['question'] == null
          ? const QuestionEntity()
          : const QuestionConverter()
              .fromJson(json['question'] as Map<String, dynamic>?),
      starCount: json['star_count'] as int? ?? 0,
    );

Map<String, dynamic> _$StarAnswerModelToJson(StarAnswerModel instance) =>
    <String, dynamic>{
      'question': const QuestionConverter().toJson(instance.question),
      'star_count': instance.starCount,
    };
