part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<StoryEntity> stories;
  final FormzStatus statusStoriesGet;

  final MakeEntity? model;

  final MakeEntity? make;
  final int announcementCount;
  final bool historySaved;

  const MainState({
    this.stories = const [],
    this.statusStoriesGet = FormzStatus.pure,
    this.model,
    this.make,
    this.announcementCount = 0,
    this.historySaved = true,
  });

  MainState copWith({
    List<StoryEntity>? stories,
    FormzStatus? statusStoriesGet,
    MakeEntity? model,
    MakeEntity? make,
    int? announcementCount,
    bool? historySaved,
  }) =>
      MainState(
        stories: stories ?? this.stories,
        statusStoriesGet: statusStoriesGet ?? this.statusStoriesGet,
        model: model?.id == -1 ? null : model ?? this.model,
        make: make?.id == -1 ? null : make ?? this.make,
        historySaved: historySaved ?? this.historySaved,
        announcementCount: announcementCount ?? this.announcementCount,
      );

  @override
  List<Object?> get props => [
        stories,
        statusStoriesGet,
        model,
        make,
        announcementCount,
        historySaved,
      ];
}
