import 'package:auto/features/main/domain/entities/category_entity.dart';
import 'package:auto/features/main/domain/entities/story_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StoryModel extends StoryEntity {
  const StoryModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.content,
    required super.icon,
    required super.url,
    required super.expired,
    required super.redirectTo,
    required super.redirectData,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
