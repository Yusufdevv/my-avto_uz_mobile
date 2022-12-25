// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_suggestion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarSuggestionModel _$CarSuggestionModelFromJson(Map<String, dynamic> json) =>
    CarSuggestionModel(
      options: (json['options'] as List<dynamic>?)
              ?.map((e) =>
                  const OptionsConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$CarSuggestionModelToJson(CarSuggestionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'options': instance.options.map(const OptionsConverter().toJson).toList(),
    };
