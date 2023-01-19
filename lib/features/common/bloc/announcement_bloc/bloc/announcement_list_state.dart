part of 'announcement_list_bloc.dart';

@freezed
class AnnouncementListState with _$AnnouncementListState {
  factory AnnouncementListState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(0) int selected,
    @Default('') String next,
    @Default('') String search,
    @Default(0) int count,
    @Default([])List<Region> regions,
    @Default(false) bool isFilter,
    @Default(false)bool isHistory,
    @Default([]) List<AnnouncementListEntity> announcementList,
    @Default(AnnouncementFilterModel()) AnnouncementFilterModel filter,
    @Default(RangeValues(1960, 2023)) RangeValues yearValues,
    @Default(RangeValues(1000, 500000)) RangeValues priceValues,
    @Default(0) int? idVal,
    @Default(GearboxTypeEntity(id: -1, type: '', logo: ''))
        GearboxTypeEntity? gearboxTypeEntity,
    @Default(BodyTypeEntity(id: -1, type: '', logo: ''))
        BodyTypeEntity? bodyTypeEntity,
    @Default(DriveTypeModel(id: -1, type: '', logo: ''))
        DriveTypeEntity? driveTypeEntity,
  }) = _AnnouncementList;
}
