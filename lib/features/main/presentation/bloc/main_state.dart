part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<StoryEntity> stories;
  final FormzStatus statusStoriesGet;

  final int? modelId;
  final String? modelName;

  final MakeEntity? make;
  final int announcementCount;
  final bool historySaved;

  const MainState({
    this.stories = const [],
    this.statusStoriesGet = FormzStatus.pure,
    this.modelId,
    this.modelName,
    this.make,
    this.announcementCount = 0,
    this.historySaved = true,
  });

  MainState copWith({
    List<StoryEntity>? stories,
    FormzStatus? statusStoriesGet,
    int? modelId,
    String? modelName,
    MakeEntity? make,
    int? announcementCount,
    bool? historySaved,
  }) =>
      MainState(
        stories: stories ?? this.stories,
        statusStoriesGet: statusStoriesGet ?? this.statusStoriesGet,
        modelId: modelId ?? this.modelId,
        modelName: modelName ?? this.modelName,
        make: make?.id == -1 ? null : make ?? this.make,
        historySaved: historySaved ?? this.historySaved,
        announcementCount: announcementCount ?? this.announcementCount,
      );

  @override
  List<Object?> get props => [
        stories,
        statusStoriesGet,
        modelId,
        modelName,
        make,
        announcementCount,
        historySaved,
      ];
}
