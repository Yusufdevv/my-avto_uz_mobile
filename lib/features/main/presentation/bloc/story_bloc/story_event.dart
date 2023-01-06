part of 'story_bloc.dart';

@immutable
abstract class StoryEvent extends Equatable {
  const StoryEvent();
}

class ReadEvent extends StoryEvent {
  final int itemId;

  const ReadEvent(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

