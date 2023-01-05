import 'package:auto/features/main/data/models/story_item_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class StoryItemEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final String content;
  final String icon;
  final String url;
  final bool expired;
  final String redirectTo;
  final bool isRead;

  const StoryItemEntity({
    this.id = -1,
    this.title = '',
    this.description = '',
    this.content = '',
    this.icon = '',
    this.url = '',
    this.expired = false,
    this.redirectTo = '',
    this.isRead = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        content,
        icon,
        url,
        expired,
        redirectTo,
        isRead,
      ];
}

class StoryItemConverter
    implements JsonConverter<StoryItemEntity, Map<String, dynamic>?> {
  const StoryItemConverter();

  @override
  StoryItemEntity fromJson(Map<String, dynamic>? json) =>
      StoryItemModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(StoryItemEntity object) => {};
}
