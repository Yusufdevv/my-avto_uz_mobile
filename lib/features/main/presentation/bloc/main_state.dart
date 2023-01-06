part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<StoryEntity> stories;

  const MainState({
    this.stories = const [],
  });

  MainState copWith({List<StoryEntity>? stories}) =>
      MainState(stories: stories ?? this.stories);

  @override
  List<Object?> get props => [stories];
}
