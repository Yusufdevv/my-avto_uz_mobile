// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      coverImageThumbnail: const CoverImageThumbnailConverter()
          .fromJson(json['cover_image_thumbnail'] as Map<String, dynamic>?),
      isRead: json['is_read'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              const StoryItemConverter().fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'cover_image_thumbnail': const CoverImageThumbnailConverter()
          .toJson(instance.coverImageThumbnail),
      'is_read': instance.isRead,
      'items': instance.items.map(const StoryItemConverter().toJson).toList(),
    };
