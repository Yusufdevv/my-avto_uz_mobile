import 'package:auto/features/main/domain/entities/story_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StoryItemModel extends StoryItemEntity {
  const StoryItemModel({
    required super.id,
    required super.title,
    required super.description,
    required super.content,
    required super.icon,
    required super.url,
    required super.expired,
    required super.redirectTo,
    required super.isRead,
  });

  factory StoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$StoryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryItemModelToJson(this);
}
