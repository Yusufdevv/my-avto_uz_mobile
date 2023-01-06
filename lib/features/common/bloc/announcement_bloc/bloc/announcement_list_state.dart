part of 'announcement_list_bloc.dart';

@freezed
class AnnouncementListState with _$AnnouncementListState {
  factory AnnouncementListState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(-1) selected,
    @Default('') next,
    @Default('') search,
    @Default(0) count,
    @Default([]) List<AnnouncementListEntity> announcementList,
  }) = _AnnouncementList;
}
