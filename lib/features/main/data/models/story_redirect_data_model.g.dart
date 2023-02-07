// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_redirect_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryRedirectDataModel _$StoryRedirectDataModelFromJson(
        Map<String, dynamic> json) =>
    StoryRedirectDataModel(
      id: json['id'] as int? ?? -1,
      slug: json['slug'] as String? ?? '',
    );

Map<String, dynamic> _$StoryRedirectDataModelToJson(
        StoryRedirectDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
    };
