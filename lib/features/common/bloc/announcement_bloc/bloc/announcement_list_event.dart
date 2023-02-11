// ignore_for_file: avoid_positional_boolean_parameters

part of 'announcement_list_bloc.dart';

@freezed
class AnnouncementListEvent with _$AnnouncementListEvent {
  factory AnnouncementListEvent.getAnnouncementList(bool? isNew) =
      _GetAnnouncementList;

  factory AnnouncementListEvent.setRegions(List<Region> regions) = _GetRegions;

  factory AnnouncementListEvent.getMinMaxPriceYear() = _GetMinMaxPriceYear;

  factory AnnouncementListEvent.setFilter({
    int? makeId,
    int? modelId,
    Currency? currency,
    GearboxTypeEntity? gearboxType,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? driveType,
    RangeValues? yearValues,
    RangeValues? priceValues,
    bool? isFilter,
  }) = _SetFilter;

  factory AnnouncementListEvent.clearFilter() = _ClearFilter;

  factory AnnouncementListEvent.saveHistory() = _SaveHistory;
}
