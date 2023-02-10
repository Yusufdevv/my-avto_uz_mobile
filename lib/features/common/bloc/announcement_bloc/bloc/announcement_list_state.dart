part of 'announcement_list_bloc.dart';

@freezed
class AnnouncementListState with _$AnnouncementListState {
  factory AnnouncementListState({
    @Default(FormzStatus.pure) FormzStatus status,
    @Default(0) int selected,
    @Default(true) bool next,
    @Default('') String search,
    @Default(SearchHistoryModel()) SearchHistoryModel searchModel,
    @Default(0) int count,
    @Default([]) List<Region> regions,
    @Default(false) bool isFilter,
    @Default(false) bool isHistory,
    @Default([]) List<AnnouncementListEntity> announcementList,
    @Default(SearchHistoryEntity()) SearchHistoryEntity searchHistory,
    @Default(RangeValues(1960, 2023)) RangeValues yearValues,
    @Default(RangeValues(1000, 500000)) RangeValues priceValues,
    @Default(Currency.usd) Currency currency,
    GearboxTypeEntity? gearboxType,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? driveType,
    int? makeId,
    int? modelId,
  }) = _AnnouncementList;
}
