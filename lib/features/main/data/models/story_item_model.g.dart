// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryItemModel _$StoryItemModelFromJson(Map<String, dynamic> json) =>
    StoryItemModel(
      id: json['id'] as int? ?? -1,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      content: json['content'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      url: json['url'] as String? ?? '',
      expired: json['expired'] as bool? ?? false,
      redirectTo: json['redirect_to'] as String? ?? '',
      isRead: json['is_read'] as bool? ?? false,
      redirectData: json['redirect_data'] == null
          ? const StoryRedirectDataEntity()
          : const StoryRedirectDataConverter()
              .fromJson(json['redirect_data'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$StoryItemModelToJson(StoryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'icon': instance.icon,
      'url': instance.url,
      'expired': instance.expired,
      'redirect_to': instance.redirectTo,
      'is_read': instance.isRead,
      'redirect_data':
          const StoryRedirectDataConverter().toJson(instance.redirectData),
    };
