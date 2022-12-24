// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarAnswerModel _$StarAnswerModelFromJson(Map<String, dynamic> json) =>
    StarAnswerModel(
      question: json['question'] as int? ?? 0,
      starCount: json['star_count'] as int? ?? 0,
    );

Map<String, dynamic> _$StarAnswerModelToJson(StarAnswerModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'star_count': instance.starCount,
    };
