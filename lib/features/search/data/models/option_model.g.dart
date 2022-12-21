// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionModel _$OptionModelFromJson(Map<String, dynamic> json) => OptionModel(
      id: json['_id'] as String? ?? '',
      index: json['_index'] as String? ?? '',
      score: (json['_score'] as num?)?.toDouble() ?? 0,
      source: json['_source'] == null
          ? const SourceEntity()
          : const SourceConverter()
              .fromJson(json['_source'] as Map<String, dynamic>?),
      text: json['text'] as String? ?? '',
      type: json['_type'] as String? ?? '',
    );

Map<String, dynamic> _$OptionModelToJson(OptionModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      '_index': instance.index,
      '_type': instance.type,
      '_id': instance.id,
      '_score': instance.score,
      '_source': const SourceConverter().toJson(instance.source),
    };
