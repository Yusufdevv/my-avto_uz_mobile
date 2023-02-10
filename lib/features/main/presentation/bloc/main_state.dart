part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<StoryEntity> stories;
  final FormzStatus statusStoriesGet;
  final  MakeEntity? selectedMake;
  final MakeEntity? selectedModel;
  final int announcementCount;
  

 const MainState({
    this.stories = const [],
    this.statusStoriesGet = FormzStatus.pure,
    this.selectedMake,
    this.selectedModel,
    this.announcementCount = 0,
  });

  MainState copWith({
    List<StoryEntity>? stories,
    FormzStatus? statusStoriesGet,
    MakeEntity? selectedMake,
    MakeEntity? selectedModel,
    int? announcementCount,
  }) =>
      MainState(
          stories: stories ?? this.stories,
          statusStoriesGet: statusStoriesGet ?? this.statusStoriesGet,
          selectedMake: selectedMake ?? this.selectedMake,
          selectedModel: selectedModel ?? this.selectedModel,
          announcementCount: announcementCount ?? this.announcementCount
          );

  @override
  List<Object?> get props => [
        stories,
        statusStoriesGet,
        selectedMake,
        selectedModel,
        announcementCount,
      ];
}
