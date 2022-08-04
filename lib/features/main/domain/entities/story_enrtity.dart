import 'package:auto/features/main/domain/entities/story_item_entity.dart';

class StoryEntity{
  final String url;
  final Duration duration;
  final StoryItemEntity storyItemEntity;
  const StoryEntity({required this.duration, required this.storyItemEntity, required this.url});
}
