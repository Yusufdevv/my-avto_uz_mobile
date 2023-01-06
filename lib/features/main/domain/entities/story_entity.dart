import 'package:auto/features/main/data/models/story_model.dart';
import 'package:auto/features/main/domain/entities/story_item_entity.dart';
import 'package:auto/features/main/domain/entities/thumbnail_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class StoryEntity extends Equatable {
  final int id;
  final String name;
  final String slug;
  @CoverImageThumbnailConverter()
  final CoverImageThumbnailEntity coverImageThumbnail;
  final bool isRead;
  @StoryItemConverter()
  final List<StoryItemEntity> items;

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        coverImageThumbnail,
        isRead,
        items,
      ];

  const StoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.coverImageThumbnail,
    required this.isRead,
    required this.items,
  });
}

class StoryConverter
    implements JsonConverter<StoryEntity, Map<String, dynamic>?> {
  const StoryConverter();

  @override
  StoryEntity fromJson(Map<String, dynamic>? json) =>
      StoryModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(StoryEntity object) => {};
}
