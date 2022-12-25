// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionsModel _$OptionsModelFromJson(Map<String, dynamic> json) => OptionsModel(
      source: json['_source'] == null
          ? const SourceEntity()
          : const SourceConverter()
              .fromJson(json['_source'] as Map<String, dynamic>?),
      text: json['text'] as String? ?? '',
    );

Map<String, dynamic> _$OptionsModelToJson(OptionsModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      '_source': const SourceConverter().toJson(instance.source),
    };
