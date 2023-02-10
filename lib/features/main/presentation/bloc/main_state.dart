part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<StoryEntity> stories;
  final FormzStatus statusStoriesGet;
  MakeEntity? selectedMake;
  MakeEntity? selectedModel;

  MainState({
    this.stories = const [],
    this.statusStoriesGet = FormzStatus.pure,
    this.selectedMake,
    this.selectedModel,
  });

  MainState copWith({
    List<StoryEntity>? stories,
    FormzStatus? statusStoriesGet,
    MakeEntity? selectedMake,
    MakeEntity? selectedModel,
  }) =>
      MainState(
          stories: stories ?? this.stories,
          statusStoriesGet: statusStoriesGet ?? this.statusStoriesGet,
          selectedMake: selectedMake ?? this.selectedMake,
          selectedModel: selectedModel ?? this.selectedModel);

  @override
  List<Object?> get props => [
        stories,
        statusStoriesGet,
        selectedMake,
        selectedModel,
      ];
}
