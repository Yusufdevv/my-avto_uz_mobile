// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
      id: json['id'] as int? ?? -1,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] == null
          ? const CategoryEntity()
          : const CategoryConverter()
              .fromJson(json['category'] as Map<String, dynamic>?),
      content: json['content'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      url: json['url'] as String? ?? '',
      expired: json['expired'] as bool? ?? false,
      redirectTo: json['redirect_to'] as String? ?? '',
      redirectData: json['redirect_data'] as String? ?? '',
    );

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': const CategoryConverter().toJson(instance.category),
      'content': instance.content,
      'icon': instance.icon,
      'url': instance.url,
      'expired': instance.expired,
      'redirect_to': instance.redirectTo,
      'redirect_data': instance.redirectData,
    };
