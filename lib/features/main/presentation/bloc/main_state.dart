part of 'main_bloc.dart';

class MainState extends Equatable {
  final List<StoryEntity> stories;
  final FormzStatus statusStoriesGet;
  final int? makeId;
  final int? modelId;
  final String? modelName;
  final String? makeName;
  final String? makeLogo;
  final int announcementCount;
  final bool historySaved;

  const MainState({
    this.stories = const [],
    this.statusStoriesGet = FormzStatus.pure,
    this.makeId,
    this.modelId,
    this.modelName,
    this.makeName,
    this.makeLogo,
    this.announcementCount = 0,
    this.historySaved = true,
  });

  MainState copWith({
    List<StoryEntity>? stories,
    FormzStatus? statusStoriesGet,
    int? makeId,
    int? modelId,
    String? modelName,
    String? makeName,
    String? makeLogo,
    int? announcementCount,
    bool? historySaved,
  }) =>
      MainState(
        stories: stories ?? this.stories,
        statusStoriesGet: statusStoriesGet ?? this.statusStoriesGet,
        makeId: makeId ?? this.makeId,
        modelId: modelId ?? this.modelId,
        modelName: modelName ?? this.modelName,
        makeName: makeName ?? this.makeName,
        makeLogo: makeLogo ?? this.makeLogo,
        historySaved: historySaved ?? this.historySaved,
        announcementCount: announcementCount ?? this.announcementCount,
      );

  @override
  List<Object?> get props => [
        stories,
        statusStoriesGet,
        makeId,
        modelId,
        modelName,
        makeName,
        makeLogo,
        announcementCount,
        historySaved,
      ];
}
