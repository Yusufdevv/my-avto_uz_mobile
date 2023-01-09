part of 'announcement_list_bloc.dart';

@freezed
class AnnouncementListEvent with _$AnnouncementListEvent {
  factory AnnouncementListEvent.getAnnouncementList() = _GetAnnouncementList;
  factory AnnouncementListEvent.getFilter(AnnouncementFilterModel filter) =
      _GetFilter;
  factory AnnouncementListEvent.getIdVal(int id) = _GetIdVal;
  factory AnnouncementListEvent.getDriveType(DriveTypeEntity entity) =
      _GetDriveType;
  factory AnnouncementListEvent.getBodyType(BodyTypeEntity entity) =
      _GetBodyType;
  factory AnnouncementListEvent.getGearboxType(GearboxTypeEntity entity) =
      _GetGearboxType;
}
