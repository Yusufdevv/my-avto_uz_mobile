// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absolute_car_name_suggest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsoluteCarNameSuggestModel _$AbsoluteCarNameSuggestModelFromJson(
        Map<String, dynamic> json) =>
    AbsoluteCarNameSuggestModel(
      length: json['length'] as int? ?? 0,
      offset: json['offset'] as int? ?? 0,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) =>
                  const OptionConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$AbsoluteCarNameSuggestModelToJson(
        AbsoluteCarNameSuggestModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'offset': instance.offset,
      'length': instance.length,
      'options': instance.options.map(const OptionConverter().toJson).toList(),
    };
