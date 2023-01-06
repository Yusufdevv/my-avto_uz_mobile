import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:auto/features/main/domain/entities/story_item_entity.dart';
import 'package:auto/features/main/domain/entities/thumbnail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StoryModel extends StoryEntity {
  const StoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.coverImageThumbnail,
    required super.isRead,
    required super.items,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
