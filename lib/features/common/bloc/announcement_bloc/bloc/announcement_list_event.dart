part of 'announcement_list_bloc.dart';

@freezed
class AnnouncementListEvent with _$AnnouncementListEvent {
  factory AnnouncementListEvent.getAnnouncementList() = _GetAnnouncementList;
  factory AnnouncementListEvent.getFilter(AnnouncementFilterModel filter) =
      _GetFilter;
  factory AnnouncementListEvent.getInfo({
    RangeValues? yearValues,
    RangeValues? priceValues,
    BodyTypeEntity? bodyType,
    DriveTypeEntity? carDriveType,
    GearboxTypeEntity? gearboxType,
    int? idVal,
  }) = _GetInfo;
}
