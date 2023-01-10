part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<StoryEntity> stories;
  final FormzStatus statusStoriesGet;

  const MainState({
    this.stories = const [],
    this.statusStoriesGet = FormzStatus.pure,
  });

  MainState copWith({
    List<StoryEntity>? stories,
    FormzStatus? statusStoriesGet,
  }) =>
      MainState(
        stories: stories ?? this.stories,
        statusStoriesGet: statusStoriesGet ?? this.statusStoriesGet,
      );

  @override
  List<Object?> get props => [stories];
}
