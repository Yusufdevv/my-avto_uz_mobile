// ignore_for_file: avoid_positional_boolean_parameters

part of 'announcement_list_bloc.dart';

@freezed
class AnnouncementListEvent with _$AnnouncementListEvent {
  factory AnnouncementListEvent.getAnnouncementList(bool? isNew) = _GetAnnouncementList;

  factory AnnouncementListEvent.getFilterClear({bool? ismake}) =
      _GetFilterClear;

  factory AnnouncementListEvent.getRegions(List<Region> regions) = _GetRegions;

  factory AnnouncementListEvent.getIsHistory(bool isHistory, bool? isNew) = _GetIsHistory;

  factory AnnouncementListEvent.getFilter(AnnouncementFilterModel filter) =
      _GetFilter;

  factory AnnouncementListEvent.getHistoryApi() = _GetHistoryApi;

  factory AnnouncementListEvent.getInfo({
    RangeValues? yearValues,
    RangeValues? priceValues,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? carDriveType,
    GearboxTypeEntity? gearboxType,
    int? idVal,
    bool? isFilter,
  }) = _GetInfo;

  factory AnnouncementListEvent.getMinMaxPriceYear(Currency currency) = _GetMinMaxPriceYear;
}
