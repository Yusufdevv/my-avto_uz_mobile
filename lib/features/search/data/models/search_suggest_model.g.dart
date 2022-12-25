// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_suggest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchSuggestModel _$SearchSuggestModelFromJson(Map<String, dynamic> json) =>
    SearchSuggestModel(
      absoluteCarNameSuggestCompletion:
          (json['absolute_car_name_suggest__completion'] as List<dynamic>?)
                  ?.map((e) => const CarSuggestionConverter()
                      .fromJson(e as Map<String, dynamic>?))
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$SearchSuggestModelToJson(SearchSuggestModel instance) =>
    <String, dynamic>{
      'absolute_car_name_suggest__completion': instance
          .absoluteCarNameSuggestCompletion
          .map(const CarSuggestionConverter().toJson)
          .toList(),
    };
