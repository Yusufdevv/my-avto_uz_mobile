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
    @Default(AnnouncementFilterModel()) AnnouncementFilterModel filter,
        @Default(0) int idVal,
    @Default(GearboxTypeEntity(id: -1, type: '', logo: ''))
        GearboxTypeEntity gearboxTypeEntity,
    @Default(BodyTypeEntity(id: -1, type: '', logo: ''))
        BodyTypeEntity bodyTypeEntity,
    @Default(DriveTypeModel(id: -1, type: '', logo: ''))
        DriveTypeEntity driveTypeEntity,
  }) = _AnnouncementList;
}
