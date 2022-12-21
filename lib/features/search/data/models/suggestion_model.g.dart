// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestionModel _$SuggestionModelFromJson(Map<String, dynamic> json) =>
    SuggestionModel(
      absoluteCarNameSuggestCompletion:
          (json['absolute_car_name_suggest__completion'] as List<dynamic>?)
                  ?.map((e) => const AbsoluteCarNameSuggestCompletionConverter()
                      .fromJson(e as Map<String, dynamic>?))
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$SuggestionModelToJson(SuggestionModel instance) =>
    <String, dynamic>{
      'absolute_car_name_suggest__completion': instance
          .absoluteCarNameSuggestCompletion
          .map(const AbsoluteCarNameSuggestCompletionConverter().toJson)
          .toList(),
    };
