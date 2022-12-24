import 'package:auto/features/main/domain/entities/category_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class StoryEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  @StoryConverter()
  final CategoryEntity category;
  final String content;
  final String icon;
  final String url;
  final bool expired;
  final String redirectTo;
  final String redirectData;

  const StoryEntity({
    this.id = -1,
    this.title = '',
    this.description = '',
    this.category = const CategoryEntity(),
    this.content = '',
    this.icon = '',
    this.url = '',
    this.expired = false,
    this.redirectTo = '',
    this.redirectData = '',
  });

  @override
  List<Object?> get props => [id, title, description];
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