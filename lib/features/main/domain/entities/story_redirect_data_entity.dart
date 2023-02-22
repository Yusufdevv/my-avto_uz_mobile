import 'package:auto/features/main/data/models/story_redirect_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class StoryRedirectDataEntity extends Equatable {
  final int id;
  final String slug;

  const StoryRedirectDataEntity({
    this.id = -1,
    this.slug = '',
  });

  @override
  List<Object?> get props => [
        id,
        slug,
      ];
}

class StoryRedirectDataConverter
    implements JsonConverter<StoryRedirectDataEntity, Map<String, dynamic>?> {
  const StoryRedirectDataConverter();

  @override
  StoryRedirectDataEntity fromJson(Map<String, dynamic>? json) =>
      StoryRedirectDataModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(StoryRedirectDataEntity object) => {};
}
