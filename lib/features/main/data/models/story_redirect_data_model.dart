import 'package:auto/features/main/domain/entities/story_redirect_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'story_redirect_data_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StoryRedirectDataModel extends StoryRedirectDataEntity {
  const StoryRedirectDataModel({
    required super.id,
    required super.slug,
  });

  factory StoryRedirectDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoryRedirectDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryRedirectDataModelToJson(this);
}
